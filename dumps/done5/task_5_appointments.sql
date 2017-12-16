 
CREATE TABLE appointments (
  id int(11) NOT NULL,
  doctor_id int(11) NOT NULL,
  patient_id int(11) NOT NULL,
  come int(11) NOT NULL DEFAULT '1',
  `time` datetime NOT NULL,
  PRIMARY KEY (id),
  KEY fk4 (doctor_id),
  KEY fk5 (patient_id),
  CONSTRAINT fk4 FOREIGN KEY (doctor_id) REFERENCES doctor (id),
  CONSTRAINT fk5 FOREIGN KEY (patient_id) REFERENCES patient (id)
);
INSERT INTO appointments VALUES (1,1,4,0,'2016-07-01 09:00:00');
INSERT INTO appointments VALUES (2,1,6,0,'2016-07-01 10:30:00');
INSERT INTO appointments VALUES (3,1,7,1,'2016-07-01 14:00:00');
INSERT INTO appointments VALUES (4,1,7,1,'2016-07-11 09:00:00');
INSERT INTO appointments VALUES (5,1,11,1,'2016-07-11 13:30:00');
INSERT INTO appointments VALUES (6,1,15,0,'2016-07-26 09:30:00');
INSERT INTO appointments VALUES (7,1,19,1,'2016-07-26 13:00:00');
INSERT INTO appointments VALUES (8,1,22,1,'2016-07-26 14:00:00');
INSERT INTO appointments VALUES (9,1,24,0,'2016-07-28 09:00:00');
INSERT INTO appointments VALUES (10,1,25,0,'2016-07-28 11:00:00');
INSERT INTO appointments VALUES (11,1,25,1,'2016-07-28 13:00:00');
INSERT INTO appointments VALUES (12,1,25,1,'2016-08-12 09:00:00');
INSERT INTO appointments VALUES (13,1,27,0,'2016-08-12 12:30:00');
INSERT INTO appointments VALUES (14,1,30,0,'2016-08-12 16:30:00');
INSERT INTO appointments VALUES (15,1,32,1,'2016-08-16 09:30:00');
INSERT INTO appointments VALUES (16,1,36,1,'2016-08-16 15:00:00');
INSERT INTO appointments VALUES (17,1,39,0,'2016-08-30 09:30:00');
INSERT INTO appointments VALUES (18,1,41,0,'2016-08-30 10:30:00');
INSERT INTO appointments VALUES (19,1,42,0,'2016-08-30 14:30:00');
INSERT INTO appointments VALUES (20,1,45,1,'2016-09-02 09:00:00');
INSERT INTO appointments VALUES (21,1,45,0,'2016-09-02 14:30:00');
INSERT INTO appointments VALUES (22,2,1,1,'2016-07-13 16:30:00');
INSERT INTO appointments VALUES (23,2,4,1,'2016-07-16 09:30:00');
INSERT INTO appointments VALUES (24,2,6,1,'2016-07-16 13:30:00');
INSERT INTO appointments VALUES (25,2,9,1,'2016-07-27 09:30:00');
INSERT INTO appointments VALUES (26,2,12,0,'2016-07-27 14:30:00');
INSERT INTO appointments VALUES (27,2,14,1,'2016-08-11 09:00:00');
INSERT INTO appointments VALUES (28,2,15,0,'2016-08-11 16:00:00');
INSERT INTO appointments VALUES (29,2,18,1,'2016-08-13 09:00:00');
INSERT INTO appointments VALUES (30,2,21,0,'2016-08-13 11:30:00');
INSERT INTO appointments VALUES (31,2,25,1,'2016-08-20 09:30:00');
INSERT INTO appointments VALUES (32,2,26,0,'2016-08-20 11:00:00');
INSERT INTO appointments VALUES (33,2,28,0,'2016-08-20 14:00:00');
INSERT INTO appointments VALUES (34,2,31,0,'2016-09-01 09:00:00');
INSERT INTO appointments VALUES (35,2,31,0,'2016-09-01 14:00:00');
INSERT INTO appointments VALUES (36,2,34,0,'2016-09-15 09:30:00');
INSERT INTO appointments VALUES (37,2,38,1,'2016-09-15 16:00:00');
INSERT INTO appointments VALUES (38,2,40,1,'2016-09-26 09:30:00');
INSERT INTO appointments VALUES (39,2,43,1,'2016-10-02 09:00:00');
INSERT INTO appointments VALUES (40,2,45,1,'2016-10-02 10:00:00');
INSERT INTO appointments VALUES (41,3,1,0,'2016-08-11 09:30:00');
INSERT INTO appointments VALUES (42,3,1,0,'2016-08-25 09:00:00');
INSERT INTO appointments VALUES (43,3,3,0,'2016-08-25 16:30:00');
INSERT INTO appointments VALUES (44,3,5,1,'2016-09-07 09:30:00');
INSERT INTO appointments VALUES (45,3,6,1,'2016-09-07 14:00:00');
INSERT INTO appointments VALUES (46,3,7,0,'2016-09-12 09:00:00');
INSERT INTO appointments VALUES (47,3,9,1,'2016-09-12 13:00:00');
INSERT INTO appointments VALUES (48,3,9,0,'2016-09-12 15:30:00');
INSERT INTO appointments VALUES (49,3,13,1,'2016-09-21 09:30:00');
INSERT INTO appointments VALUES (50,3,17,1,'2016-09-21 10:00:00');
INSERT INTO appointments VALUES (51,3,20,0,'2016-09-21 15:00:00');
INSERT INTO appointments VALUES (52,3,23,1,'2016-09-22 09:00:00');
INSERT INTO appointments VALUES (53,3,23,1,'2016-09-22 14:00:00');
INSERT INTO appointments VALUES (54,3,26,0,'2016-10-05 09:00:00');
INSERT INTO appointments VALUES (55,3,26,1,'2016-10-05 12:30:00');
INSERT INTO appointments VALUES (56,3,30,0,'2016-10-05 16:30:00');
INSERT INTO appointments VALUES (57,3,31,1,'2016-10-16 09:00:00');
INSERT INTO appointments VALUES (58,3,32,0,'2016-10-16 14:30:00');
INSERT INTO appointments VALUES (59,3,33,1,'2016-10-28 09:00:00');
INSERT INTO appointments VALUES (60,3,37,0,'2016-10-28 10:00:00');
INSERT INTO appointments VALUES (61,3,40,0,'2016-10-28 13:00:00');
INSERT INTO appointments VALUES (62,3,40,1,'2016-10-28 14:00:00');
INSERT INTO appointments VALUES (63,3,42,0,'2016-10-28 15:00:00');
INSERT INTO appointments VALUES (64,3,42,1,'2016-11-04 09:30:00');
INSERT INTO appointments VALUES (65,3,43,0,'2016-11-04 11:00:00');
INSERT INTO appointments VALUES (66,3,44,0,'2016-11-04 12:00:00');
INSERT INTO appointments VALUES (67,3,45,0,'2016-11-19 09:30:00');
INSERT INTO appointments VALUES (68,3,48,1,'2016-11-19 14:00:00');
INSERT INTO appointments VALUES (69,4,1,1,'2016-09-14 09:30:00');
INSERT INTO appointments VALUES (70,4,1,1,'2016-09-25 09:00:00');
INSERT INTO appointments VALUES (71,4,3,1,'2016-09-25 12:30:00');
INSERT INTO appointments VALUES (72,4,4,1,'2016-09-25 13:00:00');
INSERT INTO appointments VALUES (73,4,6,0,'2016-10-08 09:30:00');
INSERT INTO appointments VALUES (74,4,9,1,'2016-10-08 11:00:00');
INSERT INTO appointments VALUES (75,4,9,0,'2016-10-08 13:30:00');
INSERT INTO appointments VALUES (76,4,9,0,'2016-10-22 09:30:00');
INSERT INTO appointments VALUES (77,4,10,1,'2016-10-22 13:00:00');
INSERT INTO appointments VALUES (78,4,10,0,'2016-10-22 14:30:00');
INSERT INTO appointments VALUES (79,4,13,1,'2016-10-26 09:30:00');
INSERT INTO appointments VALUES (80,4,15,1,'2016-10-26 16:30:00');
INSERT INTO appointments VALUES (81,4,16,1,'2016-10-28 09:00:00');
INSERT INTO appointments VALUES (82,4,19,1,'2016-10-28 16:00:00');
INSERT INTO appointments VALUES (83,4,20,0,'2016-11-03 09:30:00');
INSERT INTO appointments VALUES (84,4,22,0,'2016-11-03 11:30:00');
INSERT INTO appointments VALUES (85,4,26,0,'2016-11-05 09:00:00');
INSERT INTO appointments VALUES (86,4,27,1,'2016-11-05 14:00:00');
INSERT INTO appointments VALUES (87,4,31,1,'2016-11-07 09:00:00');
INSERT INTO appointments VALUES (88,4,35,1,'2016-11-07 12:30:00');
INSERT INTO appointments VALUES (89,4,39,1,'2016-11-20 09:00:00');
INSERT INTO appointments VALUES (90,4,42,1,'2016-11-20 11:30:00');
INSERT INTO appointments VALUES (91,4,43,1,'2016-12-05 09:00:00');
INSERT INTO appointments VALUES (92,4,46,1,'2016-12-05 15:30:00');
INSERT INTO appointments VALUES (93,4,48,1,'2016-12-16 09:00:00');
INSERT INTO appointments VALUES (94,4,48,1,'2016-12-16 10:30:00');
INSERT INTO appointments VALUES (95,4,48,0,'2016-12-16 16:30:00');
INSERT INTO appointments VALUES (96,5,1,0,'2016-10-31 13:30:00');
INSERT INTO appointments VALUES (97,5,2,0,'2016-11-08 09:00:00');
INSERT INTO appointments VALUES (98,5,6,0,'2016-11-08 10:00:00');
INSERT INTO appointments VALUES (99,5,7,1,'2016-11-08 12:30:00');
INSERT INTO appointments VALUES (100,5,7,0,'2016-11-17 09:00:00');
INSERT INTO appointments VALUES (101,5,11,1,'2016-11-17 14:30:00');
INSERT INTO appointments VALUES (102,5,15,0,'2016-11-17 15:30:00');
INSERT INTO appointments VALUES (103,5,19,0,'2016-12-02 09:30:00');
INSERT INTO appointments VALUES (104,5,23,0,'2016-12-02 10:00:00');
INSERT INTO appointments VALUES (105,5,27,0,'2016-12-02 12:30:00');
INSERT INTO appointments VALUES (106,5,27,1,'2016-12-05 09:00:00');
INSERT INTO appointments VALUES (107,5,31,0,'2016-12-05 15:00:00');
INSERT INTO appointments VALUES (108,5,33,0,'2016-12-11 09:30:00');
INSERT INTO appointments VALUES (109,5,35,0,'2016-12-11 15:30:00');
INSERT INTO appointments VALUES (110,5,37,0,'2016-12-26 09:00:00');
INSERT INTO appointments VALUES (111,5,41,1,'2016-12-26 15:00:00');
INSERT INTO appointments VALUES (112,5,43,1,'2016-12-31 09:00:00');
INSERT INTO appointments VALUES (113,5,47,1,'2016-12-31 13:30:00');
INSERT INTO appointments VALUES (114,5,47,1,'2016-12-31 16:00:00');
INSERT INTO appointments VALUES (115,6,1,1,'2016-11-12 14:30:00');
INSERT INTO appointments VALUES (116,6,3,0,'2016-11-18 09:00:00');
INSERT INTO appointments VALUES (117,6,6,0,'2016-11-18 16:30:00');
INSERT INTO appointments VALUES (118,6,8,0,'2016-11-27 09:30:00');
INSERT INTO appointments VALUES (119,6,9,1,'2016-11-27 10:30:00');
INSERT INTO appointments VALUES (120,6,10,0,'2016-11-27 16:00:00');
INSERT INTO appointments VALUES (121,6,12,0,'2016-12-12 09:30:00');
INSERT INTO appointments VALUES (122,6,13,1,'2016-12-12 12:00:00');
INSERT INTO appointments VALUES (123,6,16,0,'2016-12-12 15:00:00');
INSERT INTO appointments VALUES (124,6,17,1,'2016-12-23 09:30:00');
INSERT INTO appointments VALUES (125,6,21,1,'2016-12-23 15:00:00');
INSERT INTO appointments VALUES (126,7,22,0,'2016-07-01 09:00:00');
INSERT INTO appointments VALUES (127,7,26,0,'2016-07-01 09:30:00');
INSERT INTO appointments VALUES (128,7,29,1,'2016-07-10 09:00:00');
INSERT INTO appointments VALUES (129,7,33,0,'2016-07-10 10:30:00');
INSERT INTO appointments VALUES (130,7,33,0,'2016-07-10 15:00:00');
INSERT INTO appointments VALUES (131,7,34,1,'2016-07-17 09:00:00');
INSERT INTO appointments VALUES (132,7,34,1,'2016-07-17 11:30:00');
INSERT INTO appointments VALUES (133,7,35,1,'2016-07-17 14:30:00');
INSERT INTO appointments VALUES (134,7,35,0,'2016-07-17 16:30:00');
INSERT INTO appointments VALUES (135,7,36,0,'2016-07-23 09:30:00');
INSERT INTO appointments VALUES (136,7,38,1,'2016-07-23 15:00:00');
INSERT INTO appointments VALUES (137,7,38,0,'2016-07-23 15:30:00');
INSERT INTO appointments VALUES (138,7,39,1,'2016-08-05 09:00:00');
INSERT INTO appointments VALUES (139,7,40,0,'2016-08-05 16:00:00');
INSERT INTO appointments VALUES (140,7,43,1,'2016-08-13 09:30:00');
INSERT INTO appointments VALUES (141,7,45,0,'2016-08-13 16:00:00');
INSERT INTO appointments VALUES (142,7,46,0,'2016-08-23 09:30:00');
INSERT INTO appointments VALUES (143,7,46,0,'2016-08-23 13:30:00');
INSERT INTO appointments VALUES (144,7,1,0,'2016-12-16 12:30:00');
INSERT INTO appointments VALUES (145,7,4,0,'2016-12-16 13:00:00');
INSERT INTO appointments VALUES (146,7,4,0,'2016-12-16 14:30:00');
INSERT INTO appointments VALUES (147,7,7,1,'2016-12-20 09:30:00');
INSERT INTO appointments VALUES (148,7,9,0,'2016-12-20 13:30:00');
INSERT INTO appointments VALUES (149,7,9,1,'2016-12-20 16:30:00');
INSERT INTO appointments VALUES (150,7,13,1,'2016-12-26 09:00:00');
INSERT INTO appointments VALUES (151,7,16,0,'2016-12-26 16:00:00');
INSERT INTO appointments VALUES (152,7,19,1,'2016-12-30 09:30:00');
INSERT INTO appointments VALUES (153,7,22,1,'2016-12-30 15:30:00');
INSERT INTO appointments VALUES (154,8,23,1,'2016-07-01 09:00:00');
INSERT INTO appointments VALUES (155,8,27,1,'2016-07-01 12:00:00');
INSERT INTO appointments VALUES (156,8,29,0,'2016-07-11 09:30:00');
INSERT INTO appointments VALUES (157,8,33,1,'2016-07-11 16:00:00');
INSERT INTO appointments VALUES (158,8,37,0,'2016-07-24 09:00:00');
INSERT INTO appointments VALUES (159,8,39,1,'2016-07-24 14:30:00');
INSERT INTO appointments VALUES (160,8,42,1,'2016-07-26 09:00:00');
INSERT INTO appointments VALUES (161,8,46,0,'2016-07-26 15:30:00');
INSERT INTO appointments VALUES (162,8,46,1,'2016-07-28 09:00:00');
INSERT INTO appointments VALUES (163,8,47,1,'2016-07-28 10:00:00');
INSERT INTO appointments VALUES (164,8,1,0,'2016-12-03 13:00:00');
INSERT INTO appointments VALUES (165,8,2,0,'2016-12-11 09:30:00');
INSERT INTO appointments VALUES (166,8,3,0,'2016-12-11 16:30:00');
INSERT INTO appointments VALUES (167,8,3,1,'2016-12-26 09:30:00');
INSERT INTO appointments VALUES (168,9,6,1,'2016-07-01 09:00:00');
INSERT INTO appointments VALUES (169,9,7,0,'2016-07-01 15:00:00');
INSERT INTO appointments VALUES (170,9,8,1,'2016-07-14 09:00:00');
INSERT INTO appointments VALUES (171,9,11,1,'2016-07-14 15:30:00');
INSERT INTO appointments VALUES (172,9,15,1,'2016-07-14 16:00:00');
INSERT INTO appointments VALUES (173,9,16,0,'2016-07-20 09:30:00');
INSERT INTO appointments VALUES (174,9,19,0,'2016-07-20 13:00:00');
INSERT INTO appointments VALUES (175,9,23,1,'2016-07-23 09:00:00');
INSERT INTO appointments VALUES (176,9,24,1,'2016-07-23 13:30:00');
INSERT INTO appointments VALUES (177,9,25,1,'2016-07-23 16:30:00');
INSERT INTO appointments VALUES (178,9,29,0,'2016-07-30 09:30:00');
INSERT INTO appointments VALUES (179,9,31,0,'2016-07-30 10:00:00');
INSERT INTO appointments VALUES (180,9,33,1,'2016-07-30 15:00:00');
INSERT INTO appointments VALUES (181,9,33,1,'2016-08-14 09:00:00');
INSERT INTO appointments VALUES (182,9,33,1,'2016-08-14 11:00:00');
INSERT INTO appointments VALUES (183,9,37,0,'2016-08-21 09:30:00');
INSERT INTO appointments VALUES (184,9,41,0,'2016-08-31 09:00:00');
INSERT INTO appointments VALUES (185,9,44,0,'2016-08-31 16:30:00');
INSERT INTO appointments VALUES (186,9,46,1,'2016-09-11 09:00:00');
INSERT INTO appointments VALUES (187,9,48,1,'2016-09-11 12:30:00');
INSERT INTO appointments VALUES (188,10,1,0,'2016-07-08 09:00:00');
INSERT INTO appointments VALUES (189,10,3,0,'2016-07-08 13:00:00');
INSERT INTO appointments VALUES (190,10,6,0,'2016-07-17 09:00:00');
INSERT INTO appointments VALUES (191,10,9,1,'2016-07-17 16:30:00');
INSERT INTO appointments VALUES (192,10,10,0,'2016-07-21 09:30:00');
INSERT INTO appointments VALUES (193,10,13,0,'2016-07-21 11:30:00');
INSERT INTO appointments VALUES (194,10,13,1,'2016-07-21 13:00:00');
INSERT INTO appointments VALUES (195,10,17,1,'2016-08-01 09:00:00');
INSERT INTO appointments VALUES (196,10,18,0,'2016-08-01 09:30:00');
INSERT INTO appointments VALUES (197,10,22,0,'2016-08-01 12:30:00');
INSERT INTO appointments VALUES (198,10,26,0,'2016-08-10 09:30:00');
INSERT INTO appointments VALUES (199,10,26,1,'2016-08-10 11:30:00');
INSERT INTO appointments VALUES (200,10,30,1,'2016-08-21 09:00:00');
INSERT INTO appointments VALUES (201,10,33,1,'2016-08-21 13:00:00');
INSERT INTO appointments VALUES (202,10,34,0,'2016-08-21 16:00:00');
INSERT INTO appointments VALUES (203,10,36,0,'2016-09-05 09:00:00');
INSERT INTO appointments VALUES (204,10,36,1,'2016-09-05 15:00:00');
INSERT INTO appointments VALUES (205,10,40,0,'2016-09-10 09:30:00');
INSERT INTO appointments VALUES (206,10,40,1,'2016-09-10 10:30:00');
INSERT INTO appointments VALUES (207,10,43,1,'2016-09-10 15:30:00');
INSERT INTO appointments VALUES (208,10,47,1,'2016-09-16 09:00:00');
INSERT INTO appointments VALUES (209,11,1,1,'2016-07-25 09:00:00');
INSERT INTO appointments VALUES (210,11,3,1,'2016-07-25 12:30:00');
INSERT INTO appointments VALUES (211,11,4,0,'2016-07-25 14:00:00');
INSERT INTO appointments VALUES (212,11,7,1,'2016-08-02 09:00:00');
INSERT INTO appointments VALUES (213,11,11,0,'2016-08-02 16:30:00');
INSERT INTO appointments VALUES (214,11,11,1,'2016-08-10 09:00:00');
INSERT INTO appointments VALUES (215,11,13,1,'2016-08-10 15:00:00');
INSERT INTO appointments VALUES (216,11,16,0,'2016-08-16 09:30:00');
INSERT INTO appointments VALUES (217,11,18,1,'2016-08-16 10:30:00');
INSERT INTO appointments VALUES (218,11,22,1,'2016-08-16 16:30:00');
INSERT INTO appointments VALUES (219,11,22,0,'2016-08-19 09:00:00');
INSERT INTO appointments VALUES (220,11,23,0,'2016-08-19 14:30:00');
INSERT INTO appointments VALUES (221,11,24,0,'2016-08-25 09:30:00');
INSERT INTO appointments VALUES (222,11,28,0,'2016-08-25 11:00:00');
INSERT INTO appointments VALUES (223,11,28,0,'2016-09-05 09:00:00');
INSERT INTO appointments VALUES (224,11,28,1,'2016-09-05 15:00:00');
INSERT INTO appointments VALUES (225,11,32,0,'2016-09-15 09:00:00');
INSERT INTO appointments VALUES (226,11,35,1,'2016-09-15 09:30:00');
INSERT INTO appointments VALUES (227,11,38,0,'2016-09-15 10:00:00');
INSERT INTO appointments VALUES (228,11,41,0,'2016-09-15 14:30:00');
INSERT INTO appointments VALUES (229,11,44,0,'2016-09-25 09:00:00');
INSERT INTO appointments VALUES (230,11,47,1,'2016-09-25 09:30:00');
INSERT INTO appointments VALUES (231,12,1,0,'2016-07-28 09:30:00');
INSERT INTO appointments VALUES (232,12,3,1,'2016-07-28 12:30:00');
INSERT INTO appointments VALUES (233,12,6,0,'2016-08-12 09:00:00');
INSERT INTO appointments VALUES (234,12,7,0,'2016-08-12 13:30:00');
INSERT INTO appointments VALUES (235,12,11,1,'2016-08-12 16:30:00');
INSERT INTO appointments VALUES (236,12,13,1,'2016-08-16 09:30:00');
INSERT INTO appointments VALUES (237,12,13,1,'2016-08-16 11:00:00');
INSERT INTO appointments VALUES (238,12,15,0,'2016-08-16 14:00:00');
INSERT INTO appointments VALUES (239,12,19,0,'2016-08-16 14:30:00');
INSERT INTO appointments VALUES (240,12,23,0,'2016-08-29 09:00:00');
INSERT INTO appointments VALUES (241,12,24,0,'2016-08-29 10:00:00');
INSERT INTO appointments VALUES (242,12,26,0,'2016-08-29 10:30:00');
INSERT INTO appointments VALUES (243,12,27,1,'2016-08-29 13:30:00');
INSERT INTO appointments VALUES (244,12,30,0,'2016-09-11 09:30:00');
INSERT INTO appointments VALUES (245,12,34,0,'2016-09-11 16:30:00');
INSERT INTO appointments VALUES (246,12,35,0,'2016-09-24 09:00:00');
INSERT INTO appointments VALUES (247,12,37,0,'2016-09-24 14:30:00');
INSERT INTO appointments VALUES (248,12,39,0,'2016-10-09 09:00:00');
INSERT INTO appointments VALUES (249,12,39,0,'2016-10-09 15:00:00');
INSERT INTO appointments VALUES (250,12,39,1,'2016-10-22 09:00:00');
INSERT INTO appointments VALUES (251,12,41,0,'2016-10-22 13:30:00');
INSERT INTO appointments VALUES (252,12,45,1,'2016-11-06 09:00:00');
INSERT INTO appointments VALUES (253,12,48,1,'2016-11-06 11:30:00');
INSERT INTO appointments VALUES (254,13,1,1,'2016-09-18 16:00:00');
INSERT INTO appointments VALUES (255,13,3,0,'2016-09-28 09:00:00');
INSERT INTO appointments VALUES (256,13,5,1,'2016-09-28 09:30:00');
INSERT INTO appointments VALUES (257,13,6,0,'2016-09-28 14:30:00');
INSERT INTO appointments VALUES (258,13,8,1,'2016-09-30 09:00:00');
INSERT INTO appointments VALUES (259,13,12,0,'2016-09-30 11:00:00');
INSERT INTO appointments VALUES (260,13,14,0,'2016-09-30 15:30:00');
INSERT INTO appointments VALUES (261,13,15,1,'2016-10-09 09:30:00');
INSERT INTO appointments VALUES (262,13,18,1,'2016-10-09 14:30:00');
INSERT INTO appointments VALUES (263,13,19,0,'2016-10-19 09:30:00');
INSERT INTO appointments VALUES (264,13,21,1,'2016-10-19 10:00:00');
INSERT INTO appointments VALUES (265,13,21,1,'2016-10-19 15:00:00');
INSERT INTO appointments VALUES (266,13,25,1,'2016-10-19 16:00:00');
INSERT INTO appointments VALUES (267,13,27,1,'2016-11-01 09:30:00');
INSERT INTO appointments VALUES (268,13,31,1,'2016-11-01 12:00:00');
INSERT INTO appointments VALUES (269,13,34,0,'2016-11-07 09:00:00');
INSERT INTO appointments VALUES (270,13,34,1,'2016-11-07 11:00:00');
INSERT INTO appointments VALUES (271,13,34,0,'2016-11-07 12:00:00');
INSERT INTO appointments VALUES (272,13,37,0,'2016-11-21 09:30:00');
INSERT INTO appointments VALUES (273,13,41,1,'2016-11-21 12:00:00');
INSERT INTO appointments VALUES (274,13,41,0,'2016-12-06 09:00:00');
INSERT INTO appointments VALUES (275,13,41,0,'2016-12-06 14:00:00');
INSERT INTO appointments VALUES (276,13,41,0,'2016-12-11 09:30:00');
INSERT INTO appointments VALUES (277,13,45,0,'2016-12-11 10:30:00');
INSERT INTO appointments VALUES (278,13,45,1,'2016-12-11 11:00:00');
INSERT INTO appointments VALUES (279,13,46,0,'2016-12-11 16:30:00');
INSERT INTO appointments VALUES (280,13,47,1,'2016-12-19 09:00:00');
INSERT INTO appointments VALUES (281,14,1,0,'2016-08-20 09:30:00');
INSERT INTO appointments VALUES (282,14,1,1,'2016-08-20 15:00:00');
INSERT INTO appointments VALUES (283,14,4,1,'2016-09-03 09:30:00');
INSERT INTO appointments VALUES (284,14,8,1,'2016-09-03 11:30:00');
INSERT INTO appointments VALUES (285,14,12,0,'2016-09-03 13:30:00');
INSERT INTO appointments VALUES (286,14,13,1,'2016-09-16 09:00:00');
INSERT INTO appointments VALUES (287,14,15,0,'2016-09-16 12:00:00');
INSERT INTO appointments VALUES (288,14,17,0,'2016-09-16 14:00:00');
INSERT INTO appointments VALUES (289,14,20,0,'2016-09-16 16:00:00');
INSERT INTO appointments VALUES (290,14,22,1,'2016-09-25 09:00:00');
INSERT INTO appointments VALUES (291,14,24,1,'2016-09-25 12:30:00');
INSERT INTO appointments VALUES (292,14,25,1,'2016-09-25 14:30:00');
INSERT INTO appointments VALUES (293,14,26,0,'2016-10-01 09:30:00');
INSERT INTO appointments VALUES (294,14,28,0,'2016-10-01 13:30:00');
INSERT INTO appointments VALUES (295,14,29,0,'2016-10-14 09:00:00');
INSERT INTO appointments VALUES (296,14,29,1,'2016-10-14 12:00:00');
INSERT INTO appointments VALUES (297,14,30,0,'2016-10-17 09:30:00');
INSERT INTO appointments VALUES (298,14,30,0,'2016-10-17 11:00:00');
INSERT INTO appointments VALUES (299,14,30,0,'2016-10-17 15:30:00');
INSERT INTO appointments VALUES (300,14,31,0,'2016-10-28 09:00:00');
INSERT INTO appointments VALUES (301,14,32,0,'2016-10-28 13:00:00');
INSERT INTO appointments VALUES (302,14,34,0,'2016-11-04 09:30:00');
INSERT INTO appointments VALUES (303,14,38,1,'2016-11-04 11:30:00');
INSERT INTO appointments VALUES (304,14,42,0,'2016-11-19 09:00:00');
INSERT INTO appointments VALUES (305,14,45,1,'2016-11-19 11:00:00');
INSERT INTO appointments VALUES (306,14,46,0,'2016-11-28 09:00:00');
INSERT INTO appointments VALUES (307,14,47,0,'2016-11-28 13:30:00');
INSERT INTO appointments VALUES (308,15,1,1,'2016-11-26 09:00:00');
INSERT INTO appointments VALUES (309,15,2,1,'2016-11-26 14:30:00');
INSERT INTO appointments VALUES (310,15,6,0,'2016-12-05 09:00:00');
INSERT INTO appointments VALUES (311,15,6,1,'2016-12-05 11:30:00');
INSERT INTO appointments VALUES (312,15,8,0,'2016-12-05 12:00:00');
INSERT INTO appointments VALUES (313,15,8,0,'2016-12-05 15:30:00');
INSERT INTO appointments VALUES (314,15,9,1,'2016-12-12 09:30:00');
INSERT INTO appointments VALUES (315,15,10,1,'2016-12-12 11:00:00');
INSERT INTO appointments VALUES (316,15,14,1,'2016-12-12 15:00:00');
INSERT INTO appointments VALUES (317,15,17,1,'2016-12-18 09:00:00');
INSERT INTO appointments VALUES (318,15,17,1,'2016-12-18 14:30:00');
INSERT INTO appointments VALUES (319,15,18,1,'2016-12-30 09:30:00');
INSERT INTO appointments VALUES (320,15,18,1,'2016-12-30 13:00:00');
INSERT INTO appointments VALUES (321,15,19,1,'2016-12-30 15:00:00');
INSERT INTO appointments VALUES (322,15,23,0,'2016-12-30 16:00:00');
INSERT INTO appointments VALUES (323,16,23,0,'2016-07-01 09:00:00');
INSERT INTO appointments VALUES (324,16,27,1,'2016-07-01 11:30:00');
INSERT INTO appointments VALUES (325,16,27,0,'2016-07-01 13:30:00');
INSERT INTO appointments VALUES (326,16,30,1,'2016-07-01 14:30:00');
INSERT INTO appointments VALUES (327,16,30,0,'2016-07-05 09:00:00');
INSERT INTO appointments VALUES (328,16,30,1,'2016-07-05 11:00:00');
INSERT INTO appointments VALUES (329,16,31,1,'2016-07-05 12:30:00');
INSERT INTO appointments VALUES (330,16,31,1,'2016-07-06 09:00:00');
INSERT INTO appointments VALUES (331,16,33,1,'2016-07-06 12:00:00');
INSERT INTO appointments VALUES (332,16,34,0,'2016-07-06 13:00:00');
INSERT INTO appointments VALUES (333,16,34,0,'2016-07-06 15:00:00');
INSERT INTO appointments VALUES (334,16,35,0,'2016-07-07 09:00:00');
INSERT INTO appointments VALUES (335,16,39,0,'2016-07-07 10:00:00');
INSERT INTO appointments VALUES (336,16,42,0,'2016-07-07 12:00:00');
INSERT INTO appointments VALUES (337,16,43,0,'2016-07-07 13:30:00');
INSERT INTO appointments VALUES (338,16,44,0,'2016-07-19 09:00:00');
INSERT INTO appointments VALUES (339,16,47,0,'2016-07-19 10:00:00');
INSERT INTO appointments VALUES (340,16,47,1,'2016-08-02 09:00:00');
INSERT INTO appointments VALUES (341,16,1,0,'2016-12-22 15:00:00');
INSERT INTO appointments VALUES (342,17,2,1,'2016-07-01 09:00:00');
INSERT INTO appointments VALUES (343,17,3,0,'2016-07-01 11:30:00');
INSERT INTO appointments VALUES (344,17,5,1,'2016-07-01 16:30:00');
INSERT INTO appointments VALUES (345,17,9,0,'2016-07-14 09:30:00');
INSERT INTO appointments VALUES (346,17,11,0,'2016-07-14 14:30:00');
INSERT INTO appointments VALUES (347,17,12,1,'2016-07-23 09:00:00');
INSERT INTO appointments VALUES (348,17,15,1,'2016-07-23 12:00:00');
INSERT INTO appointments VALUES (349,17,17,1,'2016-07-23 16:00:00');
INSERT INTO appointments VALUES (350,17,18,1,'2016-07-28 09:00:00');
INSERT INTO appointments VALUES (351,17,19,1,'2016-07-28 11:30:00');
INSERT INTO appointments VALUES (352,17,23,1,'2016-07-28 12:00:00');
INSERT INTO appointments VALUES (353,17,26,0,'2016-07-28 13:00:00');
INSERT INTO appointments VALUES (354,17,29,1,'2016-07-28 13:30:00');
INSERT INTO appointments VALUES (355,17,29,0,'2016-07-28 14:00:00');
INSERT INTO appointments VALUES (356,17,33,1,'2016-08-05 09:00:00');
INSERT INTO appointments VALUES (357,17,36,0,'2016-08-05 14:30:00');
INSERT INTO appointments VALUES (358,17,37,1,'2016-08-05 16:00:00');
INSERT INTO appointments VALUES (359,17,41,0,'2016-08-10 09:00:00');
INSERT INTO appointments VALUES (360,17,45,0,'2016-08-10 16:00:00');
INSERT INTO appointments VALUES (361,17,45,1,'2016-08-23 09:30:00');
INSERT INTO appointments VALUES (362,17,46,0,'2016-08-23 16:30:00');
INSERT INTO appointments VALUES (363,16,46,0,'2016-08-19 16:30:00');
INSERT INTO appointments VALUES (364,2,1,1,'2016-08-19 16:30:00');
INSERT INTO appointments VALUES (365,4,3,1,'2016-08-19 16:30:00');
 
