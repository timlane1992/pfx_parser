#!/usr/bin/env python3

import csv
import glob
import os
import pickle
import MySQLdb

class DBInserter:
    def __init__(self, data_file_path, table_name):
        """
        data_file_path contains CSV data that will be inserted into the
        pfx database.
        """
        self.conn = MySQLdb.connect(user='root', db='pfx')
        self.curs = self.conn.cursor()
        self.data_file_path = data_file_path
        self.table_name = table_name
        self.column_labels = []

    def __enter__(self):
        return self

    def __exit__(self, type, value, traceback):
        self.curs.close()
        self.conn.close()

    @classmethod
    def write_debug_info(cls, msg):
        with open('insertions_output_info.txt', 'a+') as f:
            f.write(msg + '\n')

    def insert_data(self):
        with open(self.data_file_path) as data_file:
            data_reader = csv.DictReader(data_file)

            # Keep track of 'bad rows' so that we can see if they're worth inserting later on
            bad_valsds = []
            for valsd in data_reader:

                # Don't insert data for columns which are not populated.
                cols = [col for col in valsd
                        if valsd[col] != '' and valsd[col] != 'null']
                vals = [valsd[col] for col in valsd
                        if valsd[col] != '' and valsd[col] != 'null']

                # Insert fields into database
                query = '''INSERT INTO {table} ({csv_cols})
                           VALUES ("{csv_vals}");'''.format(table=self.table_name,
                                                            csv_cols = ','.join(cols),
                                                            csv_vals = '","'.join(vals))
                try:
                    self.curs.execute(query)
                    self.conn.commit()
                except Exception as e:
                    bad_valsds.append(valsd)
                    self.write_debug_info('The following valsd could not be inserted:\n' +
                                           str(valsd) + '\n' +
                                           'Exception message: {0}.'.format(e))
                    self.conn.rollback()
                    continue

            if bad_valsds:
                pickle_path = '.'.join([self.data_file_path, 'pickle'])
                self.write_debug_info('Putting pickled data for bad rows at: ' +
                                       pickle_path)
                with open(pickle_path, 'wb') as pickle_file:
                    pickle.dump(bad_valsds, pickle_file)


def main():
    """
    Run the script.
    """
    # Get names of files to import.
    base_dir = '/Users/tlane/projects/pfx_parser/pfx_data'
    atbat_fnames = glob.glob(os.path.join(base_dir,
                                          'atbat_table*.duplicates_removed'))
    pitch_fnames = glob.glob(os.path.join(base_dir,
                                          'pitch_table*.duplicates_removed'))

    DBInserter.write_debug_info('Inserting data for {0} pitch files'.format(len(pitch_fnames)) +
                                'bat files and {0} pitch files'.format(len(pitch_fnames)))

    for atbat_fname in atbat_fnames:
        try:
            with DBInserter(atbat_fname, 'atbats') as dbinserter:
                dbinserter.insert_data()
            DBInserter.write_debug_info('Done with file {0}'.format(atbat_fname))
        except:
             emsg = 'Failed to correctly insert data for file {0}'.format(atbat_fname)
             DBInserter.write_debug_info(emsg)
             raise

    for pitch_fname in pitch_fnames:
        try:
            with DBInserter(pitch_fname, 'pitches') as dbinserter:
                dbinserter.insert_data()
            DBInserter.write_debug_info('Done with file {0}'.format(pitch_fname))
        except:
             emsg = 'Failed to correctly insert data for file {0}'.format(pitch_fname)
             DBInserter.write_debug_info(emsg)
             raise

if __name__ == '__main__':
    main()
