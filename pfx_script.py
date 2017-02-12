#!/usr/bin/env python3

import datetime
import pfx_parser_csv

def main():
    """
    Run the script.
    """
    years = [
         2011,
         2012,
         2013,
         2014,
         2015,
         2016,
    ]
    date_pairs = [  # (Month number, the last day of the month)
        (3, 31),
        (4, 30),
        (5, 31),
        (6, 30),
        (7, 31),
        (8, 30),
        (9, 30),
        (10, 31),
        (11, 30),
    ]
    for year in years:
        for month, end_day in date_pairs:
            startdate = datetime.datetime(year=year,
                                          month=month,
                                          day=1)
            enddate = datetime.datetime(year=year,
                                        month=month,
                                        day=end_day)
            try:
                pfx_parser_csv.output_pfx_data(startdate, enddate)
                with open('output_info.txt', 'a') as f:
                    f.write('Done getting pfx data for {0}-{1}\n'.format(year,
                                                                         month))
            except:
                with open('output_info.txt', 'a') as f:
                    f.write('Error when getting pfx data for {0}-{1}\n'.format(year,
                                                                               month))

if __name__ == '__main__':
    main()
