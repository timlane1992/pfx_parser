CREATE TABLE pitches(
   retro_game_id  VARCHAR(12) NULL
  ,year           INTEGER NULL
  ,st_fl          VARCHAR(1) NULL
  ,regseason_fl   VARCHAR(1) NULL
  ,playoffs_fl    VARCHAR(1) NULL
  ,game_type      VARCHAR(1) NULL
  ,game_type_des  VARCHAR(256) NULL
  ,game_id        INTEGER NULL
  ,home_team_id   VARCHAR(32) NULL
  ,home_team_lg   VARCHAR(32) NULL
  ,away_team_id   VARCHAR(32) NULL
  ,away_team_lg   VARCHAR(32) NULL
  ,interleague_fl VARCHAR(1) NULL
  ,inning         INTEGER NULL
  ,bat_home_id    VARCHAR(1)  NULL
  ,park_id        INTEGER NULL
  ,park_name      VARCHAR(256) NULL
  ,park_loc       VARCHAR(256) NULL
  ,pit_id         INTEGER NULL
  ,bat_id         INTEGER NULL
  ,pit_hand_cd    VARCHAR(1) NULL
  ,bat_hand_cd    VARCHAR(1) NULL
  ,pa_ball_ct     INTEGER NULL
  ,pa_strike_ct   INTEGER NULL
  ,outs_ct        INTEGER NULL
  ,pitch_seq      VARCHAR(256) NULL
  ,pa_terminal_fl VARCHAR(1) NULL
  ,pa_event_cd    INTEGER NULL
  ,start_bases_cd INTEGER NULL
  ,end_bases_cd   INTEGER NULL
  ,event_outs_ct  INTEGER NULL
  ,ab_number      INTEGER NULL
  ,pitch_res      VARCHAR(1) NULL
  ,pitch_des      VARCHAR(256) NULL
  ,pitch_id       INTEGER NULL
  ,x              FLOAT NULL
  ,y              FLOAT NULL
  ,start_speed    FLOAT NULL
  ,end_speed      FLOAT NULL
  ,sz_top         FLOAT NULL
  ,sz_bot         FLOAT NULL
  ,pfx_x          FLOAT NULL
  ,pfx_z          FLOAT NULL
  ,px             FLOAT NULL
  ,pz             FLOAT NULL
  ,x0             FLOAT NULL
  ,y0             FLOAT NULL
  ,z0             FLOAT NULL
  ,vx0            FLOAT NULL
  ,vy0            FLOAT NULL
  ,vz0            FLOAT NULL
  ,ax             FLOAT NULL
  ,ay             FLOAT NULL
  ,az             FLOAT NULL
  ,break_y        FLOAT NULL
  ,break_angle    FLOAT NULL
  ,break_length   FLOAT NULL
  ,pitch_type     VARCHAR(4) NULL
  ,pitch_type_seq VARCHAR(512) NULL
  ,type_conf      FLOAT NULL
  ,zone           INTEGER NULL
  ,spin_dir       FLOAT NULL
  ,spin_rate      FLOAT NULL
  ,sv_id          VARCHAR(32) NULL
);

CREATE TABLE atbats(
   retro_game_id   VARCHAR(12)
  ,year            INTEGER
  ,month           INTEGER
  ,day             INTEGER
  ,st_fl           VARCHAR(1)
  ,regseason_fl    VARCHAR(1)
  ,playoff_fl      VARCHAR(1)
  ,game_type       VARCHAR(1)
  ,game_type_des   VARCHAR(64)
  ,local_game_time VARCHAR(5)
  ,game_id         INTEGER
  ,home_team_id    VARCHAR(3)
  ,away_team_id    VARCHAR(3)
  ,home_team_lg    VARCHAR(3)
  ,away_team_lg    VARCHAR(3)
  ,interleague_fl  VARCHAR(1)
  ,park_id         INTEGER
  ,park_name       VARCHAR(256)
  ,park_location   VARCHAR(256)
  ,inning_number   INTEGER
  ,bat_home_id     VARCHAR(1)
  ,inn_outs        INTEGER
  ,ab_number       INTEGER
  ,pit_mlbid       INTEGER
  ,pit_hand_cd     VARCHAR(1)
  ,bat_mlbid       INTEGER
  ,bat_hand_cd     VARCHAR(1)
  ,ball_ct         INTEGER
  ,strike_ct       INTEGER
  ,pitch_seq       VARCHAR(64)
  ,pitch_type_seq  VARCHAR(256)
  ,event_outs_ct   INTEGER
  ,ab_des          VARCHAR(512)
  ,event_tx        VARCHAR(32)
  ,event_cd        INTEGER
  ,battedball_cd   VARCHAR(1)
  ,start_bases_cd  INTEGER
  ,end_bases_cd    INTEGER
);
