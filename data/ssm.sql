/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50640
 Source Host           : localhost:3306
 Source Schema         : ssm

 Target Server Type    : MySQL
 Target Server Version : 50640
 File Encoding         : 65001

 Date: 12/12/2018 17:22:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_dept
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE `tbl_dept`  (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_num` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_dept
-- ----------------------------
INSERT INTO `tbl_dept` VALUES (1, '开发部', '23');
INSERT INTO `tbl_dept` VALUES (3, '财务部', '12');

-- ----------------------------
-- Table structure for tbl_emp
-- ----------------------------
DROP TABLE IF EXISTS `tbl_emp`;
CREATE TABLE `tbl_emp`  (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `d_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`emp_id`) USING BTREE,
  INDEX `fk_emp_dept`(`d_id`) USING BTREE,
  CONSTRAINT `fk_emp_dept` FOREIGN KEY (`d_id`) REFERENCES `tbl_dept` (`dept_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1057 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_emp
-- ----------------------------
INSERT INTO `tbl_emp` VALUES (11, '7657410', 'M', '76574@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (12, 'da28211', 'M', 'da282@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (13, 'ae25f12', 'M', 'ae25f@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (14, '4efe113', 'M', '4efe1@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (15, '8d84214', 'M', '8d842@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (16, 'b2d5415', 'M', 'b2d54@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (17, '8226a16', 'M', '8226a@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (18, 'f28ba17', 'M', 'f28ba@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (19, 'e079a18', 'M', 'e079a@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (20, '785bc19', 'M', '785bc@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (21, 'ae10420', 'M', 'ae104@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (22, '4143f21', 'M', '4143f@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (23, '048b322', 'M', '048b3@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (24, '5eeed23', 'M', '5eeed@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (25, 'ace1a24', 'M', 'ace1a@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (26, '1e9bf25', 'M', '1e9bf@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (27, '6ebe326', 'M', '6ebe3@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (28, '2514427', 'M', '25144@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (29, 'fe94b28', 'M', 'fe94b@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (30, 'c944f29', 'M', 'c944f@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (31, 'c19fe30', 'M', 'c19fe@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (32, '3bbf831', 'M', '3bbf8@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (33, '6e9ce32', 'M', '6e9ce@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (34, '26ce933', 'M', '26ce9@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (35, '5f69334', 'M', '5f693@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (36, '2916635', 'M', '29166@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (37, '3079236', 'M', '30792@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (38, 'c8ef637', 'M', 'c8ef6@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (39, '0c50738', 'M', '0c507@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (40, '72fae39', 'M', '72fae@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (41, 'd403d40', 'M', 'd403d@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (42, 'a857441', 'M', 'a8574@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (43, 'c35e142', 'M', 'c35e1@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (44, '4df6443', 'M', '4df64@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (45, '4686c44', 'M', '4686c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (46, '5cc4445', 'M', '5cc44@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (47, '03aae46', 'M', '03aae@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (48, '9ef5647', 'M', '9ef56@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (49, '4412148', 'M', '44121@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (50, '74afb49', 'M', '74afb@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (51, '478cf50', 'M', '478cf@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (52, '8d66751', 'M', '8d667@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (53, '0f12852', 'M', '0f128@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (54, 'bb5c153', 'M', 'bb5c1@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (55, 'b5ac454', 'M', 'b5ac4@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (56, '40a2d55', 'M', '40a2d@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (57, 'b3d7c56', 'M', 'b3d7c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (58, '04fa857', 'M', '04fa8@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (59, '9fecf58', 'M', '9fecf@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (60, 'b80a559', 'M', 'b80a5@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (61, 'd3dca60', 'M', 'd3dca@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (62, 'da1a061', 'M', 'da1a0@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (63, 'e969862', 'M', 'e9698@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (64, '7f6b363', 'M', '7f6b3@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (65, '238d064', 'M', '238d0@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (66, '7892465', 'M', '78924@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (67, 'd494666', 'M', 'd4946@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (68, '6c39767', 'M', '6c397@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (69, 'cc71a68', 'M', 'cc71a@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (70, '6933069', 'M', '69330@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (71, 'd54c970', 'M', 'd54c9@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (72, 'bff4671', 'M', 'bff46@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (73, '238ef72', 'M', '238ef@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (74, '8c12c73', 'M', '8c12c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (75, '9e8c174', 'M', '9e8c1@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (76, 'f85ad75', 'M', 'f85ad@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (77, 'c216c76', 'M', 'c216c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (78, '6375777', 'M', '63757@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (79, 'd75f978', 'M', 'd75f9@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (80, 'd556779', 'M', 'd5567@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (81, 'f28dd80', 'M', 'f28dd@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (82, 'b608d81', 'M', 'b608d@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (83, 'da8c382', 'M', 'da8c3@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (84, '807d883', 'M', '807d8@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (85, 'c2abd84', 'M', 'c2abd@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (86, '842fe85', 'M', '842fe@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (87, 'c252386', 'M', 'c2523@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (88, 'af58187', 'M', 'af581@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (89, '2773088', 'M', '27730@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (90, '6467789', 'M', '64677@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (91, '05f7a90', 'M', '05f7a@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (92, 'e3b6791', 'M', 'e3b67@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (93, 'f12a292', 'M', 'f12a2@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (94, 'bf72793', 'M', 'bf727@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (95, '5f7ac94', 'M', '5f7ac@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (96, '6427b95', 'M', '6427b@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (97, 'ac3a696', 'M', 'ac3a6@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (98, '54cdd97', 'M', '54cdd@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (99, '678d798', 'M', '678d7@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (100, 'e4ef999', 'M', 'e4ef9@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (101, '835bc100', 'M', '835bc@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (102, '48d0e101', 'M', '48d0e@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (103, 'c04ef102', 'M', 'c04ef@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (104, '2294c103', 'M', '2294c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (105, '85a8c104', 'M', '85a8c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (106, '96270105', 'M', '96270@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (107, '42c6c106', 'M', '42c6c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (108, 'a3538107', 'M', 'a3538@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (109, '24b1a108', 'M', '24b1a@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (110, '86acb109', 'M', '86acb@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (111, 'fbb5f110', 'M', 'fbb5f@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (112, 'fb2d3111', 'M', 'fb2d3@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (113, '722a2112', 'M', '722a2@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (114, 'f8a5f113', 'M', 'f8a5f@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (115, '476b6114', 'M', '476b6@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (116, '4cfd4115', 'M', '4cfd4@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (117, 'b8e74116', 'M', 'b8e74@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (118, 'de53b117', 'M', 'de53b@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (119, '99ce7118', 'M', '99ce7@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (120, '89195119', 'M', '89195@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (121, '6a7ab120', 'M', '6a7ab@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (122, 'c7b78121', 'M', 'c7b78@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (123, '3f18d122', 'M', '3f18d@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (124, '63950123', 'M', '63950@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (125, 'd6028124', 'M', 'd6028@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (126, 'ae341125', 'M', 'ae341@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (127, '18e8e126', 'M', '18e8e@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (128, '3f923127', 'M', '3f923@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (129, '8c21f128', 'M', '8c21f@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (130, '4dae7129', 'M', '4dae7@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (131, '57ccb130', 'M', '57ccb@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (132, 'dc00c131', 'M', 'dc00c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (133, '69890132', 'M', '69890@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (134, '291ae133', 'M', '291ae@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (135, '04017134', 'M', '04017@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (136, 'ff898135', 'M', 'ff898@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (137, '1af83136', 'M', '1af83@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (138, '5dc4b137', 'M', '5dc4b@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (139, '711ed138', 'M', '711ed@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (140, '7919f139', 'M', '7919f@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (141, '385d3140', 'M', '385d3@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (142, 'f1b1b141', 'M', 'f1b1b@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (143, 'c1435142', 'M', 'c1435@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (144, '46dfb143', 'M', '46dfb@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (145, 'ea078144', 'M', 'ea078@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (146, '89549145', 'M', '89549@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (147, '4647c146', 'M', '4647c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (148, '190d1147', 'M', '190d1@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (149, 'cddb7148', 'M', 'cddb7@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (150, 'faddd149', 'M', 'faddd@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (151, '8ee40150', 'M', '8ee40@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (152, '7d4b8151', 'M', '7d4b8@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (153, '71bc7152', 'M', '71bc7@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (154, '45d01153', 'M', '45d01@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (155, '92b6a154', 'M', '92b6a@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (156, '2a680155', 'M', '2a680@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (157, '74bbf156', 'M', '74bbf@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (158, '1b999157', 'M', '1b999@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (159, '2c8d5158', 'M', '2c8d5@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (160, '970f2159', 'M', '970f2@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (161, 'afb3a160', 'M', 'afb3a@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (162, '73d14161', 'M', '73d14@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (163, '12df2162', 'M', '12df2@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (164, '53ad5163', 'M', '53ad5@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (165, '26576164', 'M', '26576@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (166, '45e38165', 'M', '45e38@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (167, '6c431166', 'M', '6c431@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (168, '712f2167', 'M', '712f2@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (169, '05dd5168', 'M', '05dd5@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (170, 'f4407169', 'M', 'f4407@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (171, '76245170', 'M', '76245@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (172, 'ca1d3171', 'M', 'ca1d3@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (173, '26c9a172', 'M', '26c9a@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (174, 'f909e173', 'M', 'f909e@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (175, 'dd214174', 'M', 'dd214@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (176, '168bd175', 'M', '168bd@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (177, '3bcb2176', 'M', '3bcb2@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (178, '61738177', 'M', '61738@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (179, '803a5178', 'M', '803a5@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (180, '3c3a5179', 'M', '3c3a5@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (181, 'b988f180', 'M', 'b988f@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (182, '2acf9181', 'M', '2acf9@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (183, 'c8b24182', 'M', 'c8b24@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (184, '5216e183', 'M', '5216e@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (185, '49523184', 'M', '49523@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (186, '11e9c185', 'M', '11e9c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (187, '3c94d186', 'M', '3c94d@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (188, '7d4e8187', 'M', '7d4e8@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (189, 'f8830188', 'M', 'f8830@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (190, '31aa1189', 'M', '31aa1@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (191, '67397190', 'M', '67397@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (192, 'ceaf7191', 'M', 'ceaf7@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (193, 'a5388192', 'M', 'a5388@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (194, 'a6a2c193', 'M', 'a6a2c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (195, 'dd06f194', 'M', 'dd06f@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (196, 'c4879195', 'M', 'c4879@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (197, '10cce196', 'M', '10cce@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (198, 'c3f53197', 'M', 'c3f53@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (199, 'c1a45198', 'M', 'c1a45@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (200, 'ece03199', 'M', 'ece03@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (201, '6d5af200', 'M', '6d5af@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (202, 'aeca7201', 'M', 'aeca7@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (203, '9d1f6202', 'M', '9d1f6@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (204, '5f0fa203', 'M', '5f0fa@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (205, '5ce05204', 'M', '5ce05@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (206, '981cc205', 'M', '981cc@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (207, 'a1091206', 'M', 'a1091@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (208, 'a4442207', 'M', 'a4442@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (209, '731d5208', 'M', '731d5@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (210, 'c47d5209', 'M', 'c47d5@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (211, '36211210', 'M', '36211@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (212, 'ced56211', 'M', 'ced56@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (213, '0c8fa212', 'M', '0c8fa@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (214, '5592f213', 'M', '5592f@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (215, '02921214', 'M', '02921@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (216, '70610215', 'M', '70610@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (217, 'ab303216', 'M', 'ab303@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (218, '9065d217', 'M', '9065d@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (219, 'f6cce218', 'M', 'f6cce@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (220, 'a1fb6219', 'M', 'a1fb6@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (221, 'c08f1220', 'M', 'c08f1@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (222, 'cac78221', 'M', 'cac78@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (223, '12953222', 'M', '12953@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (224, 'af534223', 'M', 'af534@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (225, '4ad81224', 'M', '4ad81@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (226, 'eacc6225', 'M', 'eacc6@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (227, '337b4226', 'M', '337b4@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (228, '05755227', 'M', '05755@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (229, '26618228', 'M', '26618@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (230, '517a6229', 'M', '517a6@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (231, '72208230', 'M', '72208@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (232, '1e534231', 'M', '1e534@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (233, '7ab3e232', 'M', '7ab3e@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (234, 'e8790233', 'M', 'e8790@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (235, '6f254234', 'M', '6f254@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (236, '0ea7f235', 'M', '0ea7f@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (237, '5b96b236', 'M', '5b96b@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (238, 'bace2237', 'M', 'bace2@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (239, '7d29f238', 'M', '7d29f@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (240, 'a4e32239', 'M', 'a4e32@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (241, '8ca6c240', 'M', '8ca6c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (242, '96759241', 'M', '96759@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (243, '696c7242', 'M', '696c7@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (244, 'bf727243', 'M', 'bf727@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (245, '459b7244', 'M', '459b7@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (246, '84c1c245', 'M', '84c1c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (247, 'a30d1246', 'M', 'a30d1@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (248, 'a3fa6247', 'M', 'a3fa6@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (249, '414ab248', 'M', '414ab@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (250, '26bb2249', 'M', '26bb2@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (251, '50af0250', 'M', '50af0@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (252, '3e0d0251', 'M', '3e0d0@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (253, 'd5431252', 'M', 'd5431@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (254, '0f230253', 'M', '0f230@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (255, '74a9a254', 'M', '74a9a@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (256, '503c8255', 'M', '503c8@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (257, 'b4daa256', 'M', 'b4daa@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (258, '6d8fb257', 'M', '6d8fb@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (259, '3126c258', 'M', '3126c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (260, '48de0259', 'M', '48de0@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (261, 'f8beb260', 'M', 'f8beb@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (262, 'a69bb261', 'M', 'a69bb@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (263, '8d1da262', 'M', '8d1da@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (264, '18c8e263', 'M', '18c8e@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (265, '671c6264', 'M', '671c6@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (266, '459af265', 'M', '459af@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (267, '5772f266', 'M', '5772f@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (268, '88491267', 'M', '88491@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (269, '226fc268', 'M', '226fc@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (270, 'fa1aa269', 'M', 'fa1aa@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (271, '2163d270', 'M', '2163d@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (272, 'a2536271', 'M', 'a2536@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (273, '78ee3272', 'M', '78ee3@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (274, '5e7d0273', 'M', '5e7d0@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (275, 'a2294274', 'M', 'a2294@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (276, '29d92275', 'M', '29d92@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (277, 'b95ae276', 'M', 'b95ae@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (278, '0d580277', 'M', '0d580@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (279, 'ebe50278', 'M', 'ebe50@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (280, 'fb59c279', 'M', 'fb59c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (281, '287b2280', 'M', '287b2@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (282, '30276281', 'M', '30276@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (283, 'd6111282', 'M', 'd6111@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (284, 'fe610283', 'M', 'fe610@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (285, 'bea58284', 'M', 'bea58@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (286, 'd3274285', 'M', 'd3274@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (287, '24da5286', 'M', '24da5@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (288, '32faf287', 'M', '32faf@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (289, '6b6a9288', 'M', '6b6a9@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (290, 'c9b15289', 'M', 'c9b15@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (291, '1840c290', 'M', '1840c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (292, '1c010291', 'M', '1c010@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (293, '55de6292', 'M', '55de6@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (294, 'b44f2293', 'M', 'b44f2@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (295, '0d813294', 'M', '0d813@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (296, '952c8295', 'M', '952c8@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (297, 'db153296', 'M', 'db153@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (298, '71322297', 'M', '71322@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (299, '337e9298', 'M', '337e9@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (300, '31816299', 'M', '31816@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (301, '223af300', 'M', '223af@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (302, '03606301', 'M', '03606@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (303, '656d3302', 'M', '656d3@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (304, 'cb00a303', 'M', 'cb00a@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (305, 'cdad0304', 'M', 'cdad0@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (306, '91e96305', 'M', '91e96@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (307, '51135306', 'M', '51135@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (308, '8a07d307', 'M', '8a07d@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (309, '69148308', 'M', '69148@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (310, 'c60ab309', 'M', 'c60ab@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (311, '43501310', 'M', '43501@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (312, '93b50311', 'M', '93b50@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (313, '2ab16312', 'M', '2ab16@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (314, 'cec72313', 'M', 'cec72@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (315, 'd68de314', 'M', 'd68de@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (316, '8b593315', 'M', '8b593@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (317, 'c21fd316', 'M', 'c21fd@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (318, '8674c317', 'M', '8674c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (319, 'ffe07318', 'M', 'ffe07@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (320, 'ab1d9319', 'M', 'ab1d9@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (321, '29d8e320', 'M', '29d8e@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (322, '044e8321', 'M', '044e8@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (323, '22214322', 'M', '22214@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (324, '71405323', 'M', '71405@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (325, 'e3b53324', 'M', 'e3b53@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (326, '0c507325', 'M', '0c507@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (327, 'e8982326', 'M', 'e8982@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (328, '428f9327', 'M', '428f9@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (329, 'a65c0328', 'M', 'a65c0@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (330, '2a7ca329', 'M', '2a7ca@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (331, 'a3551330', 'M', 'a3551@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (332, '3342c331', 'M', '3342c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (333, '99d04332', 'M', '99d04@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (334, 'c9c75333', 'M', 'c9c75@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (335, '4000a334', 'M', '4000a@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (336, 'ae531335', 'M', 'ae531@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (337, '96b72336', 'M', '96b72@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (338, 'df6a8337', 'M', 'df6a8@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (339, 'f415b338', 'M', 'f415b@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (340, 'bdde2339', 'M', 'bdde2@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (341, '5fb58340', 'M', '5fb58@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (342, 'e6d74341', 'M', 'e6d74@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (343, '69a66342', 'M', '69a66@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (344, '20b30343', 'M', '20b30@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (345, '12223344', 'M', '12223@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (346, 'a289a345', 'M', 'a289a@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (347, '7cf9b346', 'M', '7cf9b@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (348, '40ec9347', 'M', '40ec9@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (349, '4590f348', 'M', '4590f@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (350, '281c8349', 'M', '281c8@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (351, '134dc350', 'M', '134dc@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (352, 'bb44b351', 'M', 'bb44b@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (353, '55984352', 'M', '55984@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (354, '61dad353', 'M', '61dad@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (355, '1bed4354', 'M', '1bed4@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (356, '97def355', 'M', '97def@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (357, '1464c356', 'M', '1464c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (358, '41999357', 'M', '41999@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (359, 'ae6bd358', 'M', 'ae6bd@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (360, 'aba40359', 'M', 'aba40@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (361, 'ce2e2360', 'M', 'ce2e2@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (362, '49665361', 'M', '49665@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (363, 'af985362', 'M', 'af985@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (364, '5da5b363', 'M', '5da5b@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (365, 'e107c364', 'M', 'e107c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (366, 'f59b6365', 'M', 'f59b6@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (367, '4f6b9366', 'M', '4f6b9@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (368, 'dbb0f367', 'M', 'dbb0f@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (369, 'cc71b368', 'M', 'cc71b@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (370, 'b6831369', 'M', 'b6831@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (371, '28549370', 'M', '28549@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (372, 'c055c371', 'M', 'c055c@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (373, '9ee7e372', 'M', '9ee7e@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (374, '30967373', 'M', '30967@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (375, '8e95f374', 'M', '8e95f@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (376, 'efe2f375', 'M', 'efe2f@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (377, 'b96bd376', 'M', 'b96bd@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (378, '85cbd377', 'M', '85cbd@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (379, 'fca55378', 'M', 'fca55@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (380, '52c35379', 'M', '52c35@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (381, 'bf4ac380', 'M', 'bf4ac@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (382, 'afc6a381', 'M', 'afc6a@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (383, 'abebf382', 'M', 'abebf@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (384, '57bbd383', 'M', '57bbd@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (385, 'ea81d384', 'M', 'ea81d@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (386, '8829e385', 'M', '8829e@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (387, '79055386', 'M', '79055@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (388, '9e7ec387', 'M', '9e7ec@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (389, '680d2388', 'M', '680d2@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (390, '6003d389', 'M', '6003d@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (391, 'debc4390', 'M', 'debc4@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (392, 'bde9e391', 'M', 'bde9e@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (393, 'b0997392', 'M', 'b0997@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (394, '3b6b8393', 'M', '3b6b8@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (395, '0971e394', 'M', '0971e@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (396, '13663395', 'M', '13663@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (397, 'b0869396', 'M', 'b0869@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (398, '65418397', 'M', '65418@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (399, '63219398', 'M', '63219@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (400, '5aaf2399', 'M', '5aaf2@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (401, 'e1a03400', 'M', 'e1a03@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (402, '9d291401', 'M', '9d291@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (403, 'e0ecb402', 'M', 'e0ecb@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (404, 'd4f3d403', 'M', 'd4f3d@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (405, 'c452f404', 'M', 'c452f@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (986, 'ff4ac985', 'M', 'ff4ac@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (987, 'aa376986', 'M', 'aa376@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (988, '5db49987', 'M', '5db49@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (989, '02052988', 'M', '02052@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (990, '0b98a989', 'M', '0b98a@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (991, '34af4990', 'M', '34af4@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (992, '770de991', 'M', '770de@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (993, 'b1e67992', 'M', 'b1e67@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (994, 'a49ff993', 'M', 'a49ff@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (995, 'c2cc4994', 'M', 'c2cc4@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (997, '77cee996', 'M', '77cee@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (998, '72602997', 'M', '72602@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (999, '1ad4b998', 'M', '1ad4b@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (1000, 'ac8e6999', 'M', 'ac8e6@qq.ocm', 1);
INSERT INTO `tbl_emp` VALUES (1037, '张三', 'M', 'zhangsan@qq.com', 1);
INSERT INTO `tbl_emp` VALUES (1038, '123111', 'F', '123@12.com', 3);
INSERT INTO `tbl_emp` VALUES (1054, '12312312', 'F', '234234@qq.com', 3);
INSERT INTO `tbl_emp` VALUES (1055, '12312312', 'M', '457657567@234.com', 1);

SET FOREIGN_KEY_CHECKS = 1;
