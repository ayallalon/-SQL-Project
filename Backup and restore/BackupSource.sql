prompt PL/SQL Developer import file
prompt Created on יום שישי 14 אפריל 2023 by AYALA
set feedback off
set define off
prompt Creating MENU...
create table MENU
(
  m_id    NUMBER(3) not null,
  m_name  VARCHAR2(15) not null,
  m_price NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MENU
  add primary key (M_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PERSON...
create table PERSON
(
  p_id   NUMBER(3) not null,
  p_name VARCHAR2(15) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PERSON
  add primary key (P_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating WORKER...
create table WORKER
(
  salary NUMBER(5) not null,
  pwo_id NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKER
  add primary key (PWO_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKER
  add foreign key (PWO_ID)
  references PERSON (P_ID);

prompt Creating WAITER...
create table WAITER
(
  seniority NUMBER(3) not null,
  pw_id     NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WAITER
  add primary key (PW_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WAITER
  add foreign key (PW_ID)
  references WORKER (PWO_ID);

prompt Creating CLIENT...
create table CLIENT
(
  c_phone VARCHAR2(10) not null,
  pc_id   NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLIENT
  add primary key (PC_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLIENT
  add foreign key (PC_ID)
  references PERSON (P_ID);

prompt Creating ORDERR...
create table ORDERR
(
  o_date DATE not null,
  o_id   NUMBER(4) not null,
  pc_id  NUMBER(3) not null,
  pw_id  NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERR
  add primary key (O_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERR
  add foreign key (PC_ID)
  references CLIENT (PC_ID);
alter table ORDERR
  add foreign key (PW_ID)
  references WAITER (PW_ID);

prompt Creating CHOOSEO...
create table CHOOSEO
(
  ch_amount NUMBER(3) not null,
  m_id      NUMBER(3) not null,
  o_id      NUMBER(4) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CHOOSEO
  add primary key (M_ID, O_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CHOOSEO
  add foreign key (M_ID)
  references MENU (M_ID);
alter table CHOOSEO
  add foreign key (O_ID)
  references ORDERR (O_ID);

prompt Creating PRODUCT...
create table PRODUCT
(
  pr_id   NUMBER(3) not null,
  p_name  VARCHAR2(25) not null,
  p_price NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT
  add primary key (PR_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CONTAINING...
create table CONTAINING
(
  c_amount NUMBER(3) not null,
  m_id     NUMBER(3) not null,
  pr_id    NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CONTAINING
  add primary key (M_ID, PR_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CONTAINING
  add foreign key (M_ID)
  references MENU (M_ID);
alter table CONTAINING
  add foreign key (PR_ID)
  references PRODUCT (PR_ID);

prompt Creating KITCHENWORKER...
create table KITCHENWORKER
(
  rank  CHAR(1) not null,
  pk_id NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KITCHENWORKER
  add primary key (PK_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KITCHENWORKER
  add foreign key (PK_ID)
  references WORKER (PWO_ID);

prompt Creating RESPONSIBLE...
create table RESPONSIBLE
(
  pk_id NUMBER(3) not null,
  m_id  NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table RESPONSIBLE
  add primary key (PK_ID, M_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table RESPONSIBLE
  add foreign key (PK_ID)
  references KITCHENWORKER (PK_ID);
alter table RESPONSIBLE
  add foreign key (M_ID)
  references MENU (M_ID);

prompt Creating SUPPLIER...
create table SUPPLIER
(
  s_id   NUMBER(3) not null,
  s_name VARCHAR2(15) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SUPPLIER
  add primary key (S_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SUPPLY...
create table SUPPLY
(
  s_amount NUMBER(3) not null,
  s_date   DATE not null,
  s_id     NUMBER(3) not null,
  pr_id    NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SUPPLY
  add primary key (S_ID, PR_ID, S_DATE)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SUPPLY
  add foreign key (S_ID)
  references SUPPLIER (S_ID);
alter table SUPPLY
  add foreign key (PR_ID)
  references PRODUCT (PR_ID);

prompt Disabling triggers for MENU...
alter table MENU disable all triggers;
prompt Disabling triggers for PERSON...
alter table PERSON disable all triggers;
prompt Disabling triggers for WORKER...
alter table WORKER disable all triggers;
prompt Disabling triggers for WAITER...
alter table WAITER disable all triggers;
prompt Disabling triggers for CLIENT...
alter table CLIENT disable all triggers;
prompt Disabling triggers for ORDERR...
alter table ORDERR disable all triggers;
prompt Disabling triggers for CHOOSEO...
alter table CHOOSEO disable all triggers;
prompt Disabling triggers for PRODUCT...
alter table PRODUCT disable all triggers;
prompt Disabling triggers for CONTAINING...
alter table CONTAINING disable all triggers;
prompt Disabling triggers for KITCHENWORKER...
alter table KITCHENWORKER disable all triggers;
prompt Disabling triggers for RESPONSIBLE...
alter table RESPONSIBLE disable all triggers;
prompt Disabling triggers for SUPPLIER...
alter table SUPPLIER disable all triggers;
prompt Disabling triggers for SUPPLY...
alter table SUPPLY disable all triggers;
prompt Disabling foreign key constraints for WORKER...
alter table WORKER disable constraint SYS_C007153;
prompt Disabling foreign key constraints for WAITER...
alter table WAITER disable constraint SYS_C007161;
prompt Disabling foreign key constraints for CLIENT...
alter table CLIENT disable constraint SYS_C007149;
prompt Disabling foreign key constraints for ORDERR...
alter table ORDERR disable constraint SYS_C007167;
alter table ORDERR disable constraint SYS_C007168;
prompt Disabling foreign key constraints for CHOOSEO...
alter table CHOOSEO disable constraint SYS_C007191;
alter table CHOOSEO disable constraint SYS_C007192;
prompt Disabling foreign key constraints for CONTAINING...
alter table CONTAINING disable constraint SYS_C007173;
alter table CONTAINING disable constraint SYS_C007174;
prompt Disabling foreign key constraints for KITCHENWORKER...
alter table KITCHENWORKER disable constraint SYS_C007157;
prompt Disabling foreign key constraints for RESPONSIBLE...
alter table RESPONSIBLE disable constraint SYS_C007185;
alter table RESPONSIBLE disable constraint SYS_C007186;
prompt Disabling foreign key constraints for SUPPLY...
alter table SUPPLY disable constraint SYS_C007180;
alter table SUPPLY disable constraint SYS_C007181;
prompt Deleting SUPPLY...
delete from SUPPLY;
commit;
prompt Deleting SUPPLIER...
delete from SUPPLIER;
commit;
prompt Deleting RESPONSIBLE...
delete from RESPONSIBLE;
commit;
prompt Deleting KITCHENWORKER...
delete from KITCHENWORKER;
commit;
prompt Deleting CONTAINING...
delete from CONTAINING;
commit;
prompt Deleting PRODUCT...
delete from PRODUCT;
commit;
prompt Deleting CHOOSEO...
delete from CHOOSEO;
commit;
prompt Deleting ORDERR...
delete from ORDERR;
commit;
prompt Deleting CLIENT...
delete from CLIENT;
commit;
prompt Deleting WAITER...
delete from WAITER;
commit;
prompt Deleting WORKER...
delete from WORKER;
commit;
prompt Deleting PERSON...
delete from PERSON;
commit;
prompt Deleting MENU...
delete from MENU;
commit;
prompt Loading MENU...
insert into MENU (m_id, m_name, m_price)
values (1, 'Pasta', 40);
insert into MENU (m_id, m_name, m_price)
values (2, 'Pizza', 50);
insert into MENU (m_id, m_name, m_price)
values (3, 'Fish', 90);
insert into MENU (m_id, m_name, m_price)
values (4, 'Greek salad', 60);
insert into MENU (m_id, m_name, m_price)
values (5, 'Blintzes', 92);
insert into MENU (m_id, m_name, m_price)
values (6, 'Mushroom soup', 92);
insert into MENU (m_id, m_name, m_price)
values (7, 'Orange soup', 98);
insert into MENU (m_id, m_name, m_price)
values (8, 'French salad', 67);
insert into MENU (m_id, m_name, m_price)
values (9, 'Bread', 97);
insert into MENU (m_id, m_name, m_price)
values (10, 'Pie', 52);
insert into MENU (m_id, m_name, m_price)
values (11, 'Mushroom soup', 75);
insert into MENU (m_id, m_name, m_price)
values (12, 'Mushroom soup', 54);
insert into MENU (m_id, m_name, m_price)
values (13, 'Cherry tomato s', 73);
insert into MENU (m_id, m_name, m_price)
values (14, 'Greek salad', 95);
insert into MENU (m_id, m_name, m_price)
values (15, 'Chocolate cake', 79);
insert into MENU (m_id, m_name, m_price)
values (16, 'Tomato soup', 79);
insert into MENU (m_id, m_name, m_price)
values (17, 'Chocolate cake', 88);
insert into MENU (m_id, m_name, m_price)
values (18, 'Creamed potato', 72);
insert into MENU (m_id, m_name, m_price)
values (19, 'Lasagna', 95);
insert into MENU (m_id, m_name, m_price)
values (20, 'Bread', 82);
insert into MENU (m_id, m_name, m_price)
values (21, 'Cheese cake', 70);
insert into MENU (m_id, m_name, m_price)
values (22, 'Creamed potato', 73);
insert into MENU (m_id, m_name, m_price)
values (23, 'Tomato soup', 75);
commit;
prompt 23 records loaded
prompt Loading PERSON...
insert into PERSON (p_id, p_name)
values (1, 'Ayala');
insert into PERSON (p_id, p_name)
values (2, 'Hadas');
insert into PERSON (p_id, p_name)
values (3, 'Lea');
insert into PERSON (p_id, p_name)
values (4, 'Noa');
insert into PERSON (p_id, p_name)
values (5, 'Yael');
insert into PERSON (p_id, p_name)
values (6, 'Sara');
insert into PERSON (p_id, p_name)
values (7, 'David');
insert into PERSON (p_id, p_name)
values (8, 'Moshe');
insert into PERSON (p_id, p_name)
values (9, 'Jodie');
insert into PERSON (p_id, p_name)
values (10, 'Adam');
insert into PERSON (p_id, p_name)
values (11, 'Rascal');
insert into PERSON (p_id, p_name)
values (12, 'Eliza');
insert into PERSON (p_id, p_name)
values (13, 'Alan');
insert into PERSON (p_id, p_name)
values (14, 'Allison');
insert into PERSON (p_id, p_name)
values (15, 'Willie');
insert into PERSON (p_id, p_name)
values (16, 'Nickel');
insert into PERSON (p_id, p_name)
values (17, 'Cameron');
insert into PERSON (p_id, p_name)
values (18, 'Teri');
insert into PERSON (p_id, p_name)
values (19, 'Armand');
insert into PERSON (p_id, p_name)
values (20, 'Wally');
insert into PERSON (p_id, p_name)
values (21, 'Alan');
insert into PERSON (p_id, p_name)
values (22, 'King');
insert into PERSON (p_id, p_name)
values (23, 'Gary');
insert into PERSON (p_id, p_name)
values (24, 'Emilio');
insert into PERSON (p_id, p_name)
values (25, 'Beth');
insert into PERSON (p_id, p_name)
values (26, 'Phoebe');
insert into PERSON (p_id, p_name)
values (27, 'Angela');
insert into PERSON (p_id, p_name)
values (28, 'Woody');
insert into PERSON (p_id, p_name)
values (29, 'Clive');
insert into PERSON (p_id, p_name)
values (30, 'Morgan');
insert into PERSON (p_id, p_name)
values (31, 'Ali');
insert into PERSON (p_id, p_name)
values (32, 'Illeana');
insert into PERSON (p_id, p_name)
values (33, 'Angie');
insert into PERSON (p_id, p_name)
values (34, 'Ronnie');
insert into PERSON (p_id, p_name)
values (35, 'Fisher');
insert into PERSON (p_id, p_name)
values (36, 'Kate');
insert into PERSON (p_id, p_name)
values (37, 'Ossie');
insert into PERSON (p_id, p_name)
values (38, 'Candice');
insert into PERSON (p_id, p_name)
values (39, 'Colleen');
insert into PERSON (p_id, p_name)
values (40, 'Jake');
insert into PERSON (p_id, p_name)
values (41, 'Ned');
insert into PERSON (p_id, p_name)
values (42, 'Jeroen');
insert into PERSON (p_id, p_name)
values (43, 'Suzanne');
insert into PERSON (p_id, p_name)
values (44, 'Kieran');
insert into PERSON (p_id, p_name)
values (45, 'Sona');
insert into PERSON (p_id, p_name)
values (46, 'Maria');
insert into PERSON (p_id, p_name)
values (47, 'Tyrone');
insert into PERSON (p_id, p_name)
values (48, 'Franco');
insert into PERSON (p_id, p_name)
values (49, 'Ricardo');
insert into PERSON (p_id, p_name)
values (50, 'Fairuza');
insert into PERSON (p_id, p_name)
values (51, 'Roger');
insert into PERSON (p_id, p_name)
values (52, 'Juan');
insert into PERSON (p_id, p_name)
values (53, 'Nigel');
insert into PERSON (p_id, p_name)
values (54, 'Emma');
insert into PERSON (p_id, p_name)
values (55, 'Julio');
insert into PERSON (p_id, p_name)
values (56, 'Treat');
insert into PERSON (p_id, p_name)
values (57, 'Donal');
insert into PERSON (p_id, p_name)
values (58, 'Whoopi');
insert into PERSON (p_id, p_name)
values (59, 'Candice');
insert into PERSON (p_id, p_name)
values (60, 'Luke');
insert into PERSON (p_id, p_name)
values (61, 'Avril');
insert into PERSON (p_id, p_name)
values (62, 'Caroline');
insert into PERSON (p_id, p_name)
values (63, 'Nastassja');
insert into PERSON (p_id, p_name)
values (64, 'Brendan');
insert into PERSON (p_id, p_name)
values (65, 'Gordon');
insert into PERSON (p_id, p_name)
values (66, 'Aida');
insert into PERSON (p_id, p_name)
values (67, 'Larry');
insert into PERSON (p_id, p_name)
values (68, 'Azucar');
insert into PERSON (p_id, p_name)
values (69, 'Kelli');
insert into PERSON (p_id, p_name)
values (70, 'Russell');
insert into PERSON (p_id, p_name)
values (71, 'Debby');
insert into PERSON (p_id, p_name)
values (72, 'Forest');
insert into PERSON (p_id, p_name)
values (73, 'Alan');
insert into PERSON (p_id, p_name)
values (74, 'Udo');
insert into PERSON (p_id, p_name)
values (75, 'Nile');
insert into PERSON (p_id, p_name)
values (76, 'Betty');
insert into PERSON (p_id, p_name)
values (77, 'Hilary');
insert into PERSON (p_id, p_name)
values (78, 'Vickie');
insert into PERSON (p_id, p_name)
values (79, 'Gwyneth');
insert into PERSON (p_id, p_name)
values (80, 'Kid');
insert into PERSON (p_id, p_name)
values (81, 'Alice');
insert into PERSON (p_id, p_name)
values (82, 'Breckin');
insert into PERSON (p_id, p_name)
values (83, 'Swoosie');
insert into PERSON (p_id, p_name)
values (84, 'Meg');
insert into PERSON (p_id, p_name)
values (85, 'Shelby');
insert into PERSON (p_id, p_name)
values (86, 'Gran');
insert into PERSON (p_id, p_name)
values (87, 'Dylan');
insert into PERSON (p_id, p_name)
values (88, 'Lydia');
insert into PERSON (p_id, p_name)
values (89, 'Katrin');
insert into PERSON (p_id, p_name)
values (90, 'Derrick');
insert into PERSON (p_id, p_name)
values (91, 'Gin');
insert into PERSON (p_id, p_name)
values (92, 'Claude');
insert into PERSON (p_id, p_name)
values (93, 'Cate');
insert into PERSON (p_id, p_name)
values (94, 'Wes');
insert into PERSON (p_id, p_name)
values (95, 'Rachael');
insert into PERSON (p_id, p_name)
values (96, 'Lin');
insert into PERSON (p_id, p_name)
values (97, 'First');
insert into PERSON (p_id, p_name)
values (98, 'Stevie');
insert into PERSON (p_id, p_name)
values (99, 'Christina');
insert into PERSON (p_id, p_name)
values (100, 'Aida');
commit;
prompt 100 records committed...
insert into PERSON (p_id, p_name)
values (101, 'Lorraine');
insert into PERSON (p_id, p_name)
values (102, 'Tori');
insert into PERSON (p_id, p_name)
values (103, 'Sona');
insert into PERSON (p_id, p_name)
values (104, 'Queen');
insert into PERSON (p_id, p_name)
values (105, 'Josh');
insert into PERSON (p_id, p_name)
values (106, 'Rachel');
insert into PERSON (p_id, p_name)
values (107, 'Remy');
insert into PERSON (p_id, p_name)
values (108, 'Loretta');
insert into PERSON (p_id, p_name)
values (109, 'Cathy');
insert into PERSON (p_id, p_name)
values (110, 'Stewart');
insert into PERSON (p_id, p_name)
values (111, 'Patricia');
insert into PERSON (p_id, p_name)
values (112, 'Molly');
insert into PERSON (p_id, p_name)
values (113, 'Steve');
insert into PERSON (p_id, p_name)
values (114, 'Lindsey');
insert into PERSON (p_id, p_name)
values (115, 'Vanessa');
insert into PERSON (p_id, p_name)
values (116, 'Liv');
insert into PERSON (p_id, p_name)
values (117, 'Kieran');
insert into PERSON (p_id, p_name)
values (118, 'Rhona');
insert into PERSON (p_id, p_name)
values (119, 'Chalee');
insert into PERSON (p_id, p_name)
values (120, 'Praga');
insert into PERSON (p_id, p_name)
values (121, 'Rik');
insert into PERSON (p_id, p_name)
values (122, 'Cheryl');
insert into PERSON (p_id, p_name)
values (123, 'Geraldine');
insert into PERSON (p_id, p_name)
values (124, 'Oro');
insert into PERSON (p_id, p_name)
values (125, 'Patti');
insert into PERSON (p_id, p_name)
values (126, 'Sheryl');
insert into PERSON (p_id, p_name)
values (127, 'Mos');
insert into PERSON (p_id, p_name)
values (128, 'Stockard');
insert into PERSON (p_id, p_name)
values (129, 'Liv');
insert into PERSON (p_id, p_name)
values (130, 'Stevie');
insert into PERSON (p_id, p_name)
values (131, 'Meg');
insert into PERSON (p_id, p_name)
values (132, 'Leonardo');
insert into PERSON (p_id, p_name)
values (133, 'Juliana');
insert into PERSON (p_id, p_name)
values (134, 'Xander');
insert into PERSON (p_id, p_name)
values (135, 'Harvey');
insert into PERSON (p_id, p_name)
values (136, 'Ray');
insert into PERSON (p_id, p_name)
values (137, 'Jean-Claude');
insert into PERSON (p_id, p_name)
values (138, 'Jennifer');
insert into PERSON (p_id, p_name)
values (139, 'Faye');
insert into PERSON (p_id, p_name)
values (140, 'Stockard');
insert into PERSON (p_id, p_name)
values (141, 'Olympia');
insert into PERSON (p_id, p_name)
values (142, 'France');
insert into PERSON (p_id, p_name)
values (143, 'Trey');
insert into PERSON (p_id, p_name)
values (144, 'Benjamin');
insert into PERSON (p_id, p_name)
values (145, 'Debra');
insert into PERSON (p_id, p_name)
values (146, 'Roger');
insert into PERSON (p_id, p_name)
values (147, 'Rebecca');
insert into PERSON (p_id, p_name)
values (148, 'Ceili');
insert into PERSON (p_id, p_name)
values (149, 'Davy');
insert into PERSON (p_id, p_name)
values (150, 'Claire');
insert into PERSON (p_id, p_name)
values (151, 'Lin');
insert into PERSON (p_id, p_name)
values (152, 'Howard');
insert into PERSON (p_id, p_name)
values (153, 'Gladys');
insert into PERSON (p_id, p_name)
values (154, 'Olga');
insert into PERSON (p_id, p_name)
values (155, 'Guy');
insert into PERSON (p_id, p_name)
values (156, 'Jim');
insert into PERSON (p_id, p_name)
values (157, 'Dick');
insert into PERSON (p_id, p_name)
values (158, 'Johnny');
insert into PERSON (p_id, p_name)
values (159, 'Elle');
insert into PERSON (p_id, p_name)
values (160, 'Bill');
insert into PERSON (p_id, p_name)
values (161, 'Miko');
insert into PERSON (p_id, p_name)
values (162, 'Dorry');
insert into PERSON (p_id, p_name)
values (163, 'Lionel');
insert into PERSON (p_id, p_name)
values (164, 'Mili');
insert into PERSON (p_id, p_name)
values (165, 'Elle');
insert into PERSON (p_id, p_name)
values (166, 'Cheryl');
insert into PERSON (p_id, p_name)
values (167, 'Rutger');
insert into PERSON (p_id, p_name)
values (168, 'Rickie');
insert into PERSON (p_id, p_name)
values (169, 'Joy');
insert into PERSON (p_id, p_name)
values (170, 'Sona');
insert into PERSON (p_id, p_name)
values (171, 'Bradley');
insert into PERSON (p_id, p_name)
values (172, 'Anita');
insert into PERSON (p_id, p_name)
values (173, 'Rascal');
insert into PERSON (p_id, p_name)
values (174, 'Collective');
insert into PERSON (p_id, p_name)
values (175, 'Ed');
insert into PERSON (p_id, p_name)
values (176, 'Vendetta');
insert into PERSON (p_id, p_name)
values (177, 'Meredith');
insert into PERSON (p_id, p_name)
values (178, 'Ossie');
insert into PERSON (p_id, p_name)
values (179, 'Faye');
insert into PERSON (p_id, p_name)
values (180, 'Sarah');
insert into PERSON (p_id, p_name)
values (181, 'Alex');
insert into PERSON (p_id, p_name)
values (182, 'Neve');
insert into PERSON (p_id, p_name)
values (183, 'Samantha');
insert into PERSON (p_id, p_name)
values (184, 'Tommy');
insert into PERSON (p_id, p_name)
values (185, 'Melba');
insert into PERSON (p_id, p_name)
values (186, 'Desmond');
insert into PERSON (p_id, p_name)
values (187, 'Geena');
insert into PERSON (p_id, p_name)
values (188, 'Percy');
insert into PERSON (p_id, p_name)
values (189, 'Amanda');
insert into PERSON (p_id, p_name)
values (190, 'Lea');
insert into PERSON (p_id, p_name)
values (191, 'Rade');
insert into PERSON (p_id, p_name)
values (192, 'Burt');
insert into PERSON (p_id, p_name)
values (193, 'Ricardo');
insert into PERSON (p_id, p_name)
values (194, 'Arturo');
insert into PERSON (p_id, p_name)
values (195, 'Owen');
insert into PERSON (p_id, p_name)
values (196, 'Vendetta');
insert into PERSON (p_id, p_name)
values (197, 'Kenneth');
insert into PERSON (p_id, p_name)
values (198, 'Charles');
insert into PERSON (p_id, p_name)
values (199, 'Dylan');
insert into PERSON (p_id, p_name)
values (200, 'Omar');
commit;
prompt 200 records committed...
insert into PERSON (p_id, p_name)
values (201, 'Juice');
insert into PERSON (p_id, p_name)
values (202, 'Ernie');
insert into PERSON (p_id, p_name)
values (203, 'Merillee');
insert into PERSON (p_id, p_name)
values (204, 'Ethan');
insert into PERSON (p_id, p_name)
values (205, 'Terri');
insert into PERSON (p_id, p_name)
values (206, 'Louise');
insert into PERSON (p_id, p_name)
values (207, 'Gord');
insert into PERSON (p_id, p_name)
values (208, 'Kim');
insert into PERSON (p_id, p_name)
values (209, 'Kevin');
insert into PERSON (p_id, p_name)
values (210, 'Armin');
insert into PERSON (p_id, p_name)
values (211, 'Lucinda');
insert into PERSON (p_id, p_name)
values (212, 'Victoria');
insert into PERSON (p_id, p_name)
values (213, 'Karen');
insert into PERSON (p_id, p_name)
values (214, 'Cathy');
insert into PERSON (p_id, p_name)
values (215, 'Claire');
insert into PERSON (p_id, p_name)
values (216, 'Dionne');
insert into PERSON (p_id, p_name)
values (217, 'Jay');
insert into PERSON (p_id, p_name)
values (218, 'Gilbert');
insert into PERSON (p_id, p_name)
values (219, 'Rebecca');
insert into PERSON (p_id, p_name)
values (220, 'Davy');
insert into PERSON (p_id, p_name)
values (221, 'Jude');
insert into PERSON (p_id, p_name)
values (222, 'Vienna');
insert into PERSON (p_id, p_name)
values (223, 'Queen');
insert into PERSON (p_id, p_name)
values (224, 'Tcheky');
insert into PERSON (p_id, p_name)
values (225, 'Vondie');
insert into PERSON (p_id, p_name)
values (226, 'Daniel');
insert into PERSON (p_id, p_name)
values (227, 'Woody');
insert into PERSON (p_id, p_name)
values (228, 'Rebeka');
insert into PERSON (p_id, p_name)
values (229, 'Gilbert');
insert into PERSON (p_id, p_name)
values (230, 'Janice');
insert into PERSON (p_id, p_name)
values (231, 'Liam');
insert into PERSON (p_id, p_name)
values (232, 'Petula');
insert into PERSON (p_id, p_name)
values (233, 'Embeth');
insert into PERSON (p_id, p_name)
values (234, 'Brittany');
insert into PERSON (p_id, p_name)
values (235, 'Jean');
insert into PERSON (p_id, p_name)
values (236, 'Ricky');
insert into PERSON (p_id, p_name)
values (237, 'Barry');
insert into PERSON (p_id, p_name)
values (238, 'Patricia');
insert into PERSON (p_id, p_name)
values (239, 'Pelvic');
insert into PERSON (p_id, p_name)
values (240, 'Keanu');
insert into PERSON (p_id, p_name)
values (241, 'Jackie');
insert into PERSON (p_id, p_name)
values (242, 'Oliver');
insert into PERSON (p_id, p_name)
values (243, 'Lizzy');
insert into PERSON (p_id, p_name)
values (244, 'Illeana');
insert into PERSON (p_id, p_name)
values (245, 'Isaac');
insert into PERSON (p_id, p_name)
values (246, 'Peabo');
insert into PERSON (p_id, p_name)
values (247, 'Dorry');
insert into PERSON (p_id, p_name)
values (248, 'Freddie');
insert into PERSON (p_id, p_name)
values (249, 'Bridgette');
insert into PERSON (p_id, p_name)
values (250, 'Gene');
insert into PERSON (p_id, p_name)
values (251, 'Lloyd');
insert into PERSON (p_id, p_name)
values (252, 'Ricky');
insert into PERSON (p_id, p_name)
values (253, 'LeVar');
insert into PERSON (p_id, p_name)
values (254, 'Sally');
insert into PERSON (p_id, p_name)
values (255, 'Charlize');
insert into PERSON (p_id, p_name)
values (256, 'Praga');
insert into PERSON (p_id, p_name)
values (257, 'Roy');
insert into PERSON (p_id, p_name)
values (258, 'Terri');
insert into PERSON (p_id, p_name)
values (259, 'Colm');
insert into PERSON (p_id, p_name)
values (260, 'Udo');
insert into PERSON (p_id, p_name)
values (261, 'Joaquin');
insert into PERSON (p_id, p_name)
values (262, 'Stephanie');
insert into PERSON (p_id, p_name)
values (263, 'Rosanne');
insert into PERSON (p_id, p_name)
values (264, 'Jack');
insert into PERSON (p_id, p_name)
values (265, 'Kyra');
insert into PERSON (p_id, p_name)
values (266, 'Liam');
insert into PERSON (p_id, p_name)
values (267, 'Owen');
insert into PERSON (p_id, p_name)
values (268, 'Aidan');
insert into PERSON (p_id, p_name)
values (269, 'Isaac');
insert into PERSON (p_id, p_name)
values (270, 'Julianna');
insert into PERSON (p_id, p_name)
values (271, 'Lea');
insert into PERSON (p_id, p_name)
values (272, 'Lupe');
insert into PERSON (p_id, p_name)
values (273, 'Jennifer');
insert into PERSON (p_id, p_name)
values (274, 'Latin');
insert into PERSON (p_id, p_name)
values (275, 'Lena');
insert into PERSON (p_id, p_name)
values (276, 'Liev');
insert into PERSON (p_id, p_name)
values (277, 'Luke');
insert into PERSON (p_id, p_name)
values (278, 'Jake');
insert into PERSON (p_id, p_name)
values (279, 'Greg');
insert into PERSON (p_id, p_name)
values (280, 'Natacha');
insert into PERSON (p_id, p_name)
values (281, 'Miko');
insert into PERSON (p_id, p_name)
values (282, 'Julia');
insert into PERSON (p_id, p_name)
values (283, 'Ronnie');
insert into PERSON (p_id, p_name)
values (284, 'Lea');
insert into PERSON (p_id, p_name)
values (285, 'Glenn');
insert into PERSON (p_id, p_name)
values (286, 'Woody');
insert into PERSON (p_id, p_name)
values (287, 'Debbie');
insert into PERSON (p_id, p_name)
values (288, 'Angelina');
insert into PERSON (p_id, p_name)
values (289, 'Molly');
insert into PERSON (p_id, p_name)
values (290, 'Lois');
insert into PERSON (p_id, p_name)
values (291, 'Leslie');
insert into PERSON (p_id, p_name)
values (292, 'Marisa');
insert into PERSON (p_id, p_name)
values (293, 'Edie');
insert into PERSON (p_id, p_name)
values (294, 'Mark');
insert into PERSON (p_id, p_name)
values (295, 'Juliette');
insert into PERSON (p_id, p_name)
values (296, 'Hilton');
insert into PERSON (p_id, p_name)
values (297, 'Lila');
insert into PERSON (p_id, p_name)
values (298, 'Selma');
insert into PERSON (p_id, p_name)
values (299, 'Brothers');
insert into PERSON (p_id, p_name)
values (300, 'Chantי');
commit;
prompt 300 records committed...
insert into PERSON (p_id, p_name)
values (301, 'Blair');
insert into PERSON (p_id, p_name)
values (302, 'Gates');
insert into PERSON (p_id, p_name)
values (303, 'Rhona');
insert into PERSON (p_id, p_name)
values (304, 'Thelma');
insert into PERSON (p_id, p_name)
values (305, 'Bob');
insert into PERSON (p_id, p_name)
values (306, 'Larenz');
insert into PERSON (p_id, p_name)
values (307, 'Rachid');
insert into PERSON (p_id, p_name)
values (308, 'Rebeka');
insert into PERSON (p_id, p_name)
values (309, 'Jesse');
insert into PERSON (p_id, p_name)
values (310, 'Irene');
insert into PERSON (p_id, p_name)
values (311, 'Angelina');
insert into PERSON (p_id, p_name)
values (312, 'Rita');
insert into PERSON (p_id, p_name)
values (313, 'Larry');
insert into PERSON (p_id, p_name)
values (314, 'Jeanne');
insert into PERSON (p_id, p_name)
values (315, 'Sean');
insert into PERSON (p_id, p_name)
values (316, 'Kurt');
insert into PERSON (p_id, p_name)
values (317, 'Isaiah');
insert into PERSON (p_id, p_name)
values (318, 'Bo');
insert into PERSON (p_id, p_name)
values (319, 'Tramaine');
insert into PERSON (p_id, p_name)
values (320, 'Gil');
insert into PERSON (p_id, p_name)
values (321, 'Kate');
insert into PERSON (p_id, p_name)
values (322, 'Illeana');
insert into PERSON (p_id, p_name)
values (323, 'Arturo');
insert into PERSON (p_id, p_name)
values (324, 'Johnette');
insert into PERSON (p_id, p_name)
values (325, 'Rosanna');
insert into PERSON (p_id, p_name)
values (326, 'Elvis');
insert into PERSON (p_id, p_name)
values (327, 'Nik');
insert into PERSON (p_id, p_name)
values (328, 'Natacha');
insert into PERSON (p_id, p_name)
values (329, 'Elizabeth');
insert into PERSON (p_id, p_name)
values (330, 'Taryn');
insert into PERSON (p_id, p_name)
values (331, 'Allison');
insert into PERSON (p_id, p_name)
values (332, 'Ted');
insert into PERSON (p_id, p_name)
values (333, 'Jimmie');
insert into PERSON (p_id, p_name)
values (334, 'Ian');
insert into PERSON (p_id, p_name)
values (335, 'Brittany');
insert into PERSON (p_id, p_name)
values (336, 'Boz');
insert into PERSON (p_id, p_name)
values (337, 'Dom');
insert into PERSON (p_id, p_name)
values (338, 'Lila');
insert into PERSON (p_id, p_name)
values (339, 'Hazel');
insert into PERSON (p_id, p_name)
values (340, 'Elle');
insert into PERSON (p_id, p_name)
values (341, 'Willem');
insert into PERSON (p_id, p_name)
values (342, 'Dick');
insert into PERSON (p_id, p_name)
values (343, 'Rodney');
insert into PERSON (p_id, p_name)
values (344, 'Owen');
insert into PERSON (p_id, p_name)
values (345, 'Alana');
insert into PERSON (p_id, p_name)
values (346, 'Sammy');
insert into PERSON (p_id, p_name)
values (347, 'Tzi');
insert into PERSON (p_id, p_name)
values (348, 'Hex');
insert into PERSON (p_id, p_name)
values (349, 'Rosanna');
insert into PERSON (p_id, p_name)
values (350, 'Tamala');
insert into PERSON (p_id, p_name)
values (351, 'Carole');
insert into PERSON (p_id, p_name)
values (352, 'Brenda');
insert into PERSON (p_id, p_name)
values (353, 'Frances');
insert into PERSON (p_id, p_name)
values (354, 'Praga');
insert into PERSON (p_id, p_name)
values (355, 'Hex');
insert into PERSON (p_id, p_name)
values (356, 'Janice');
insert into PERSON (p_id, p_name)
values (357, 'Maury');
insert into PERSON (p_id, p_name)
values (358, 'Raymond');
insert into PERSON (p_id, p_name)
values (359, 'Terry');
insert into PERSON (p_id, p_name)
values (360, 'Vendetta');
insert into PERSON (p_id, p_name)
values (361, 'Raul');
insert into PERSON (p_id, p_name)
values (362, 'Mel');
insert into PERSON (p_id, p_name)
values (363, 'Andrea');
insert into PERSON (p_id, p_name)
values (364, 'Holly');
insert into PERSON (p_id, p_name)
values (365, 'Rory');
insert into PERSON (p_id, p_name)
values (366, 'Maureen');
insert into PERSON (p_id, p_name)
values (367, 'Vivica');
insert into PERSON (p_id, p_name)
values (368, 'Sarah');
insert into PERSON (p_id, p_name)
values (369, 'Kimberly');
insert into PERSON (p_id, p_name)
values (370, 'Zooey');
insert into PERSON (p_id, p_name)
values (371, 'Charlize');
insert into PERSON (p_id, p_name)
values (372, 'Cliff');
insert into PERSON (p_id, p_name)
values (373, 'Nils');
insert into PERSON (p_id, p_name)
values (374, 'Ozzy');
insert into PERSON (p_id, p_name)
values (375, 'Leonardo');
insert into PERSON (p_id, p_name)
values (376, 'Colm');
insert into PERSON (p_id, p_name)
values (377, 'Kirk');
insert into PERSON (p_id, p_name)
values (378, 'James');
insert into PERSON (p_id, p_name)
values (379, 'Jay');
insert into PERSON (p_id, p_name)
values (380, 'Chaka');
insert into PERSON (p_id, p_name)
values (381, 'Marley');
insert into PERSON (p_id, p_name)
values (382, 'Aaron');
insert into PERSON (p_id, p_name)
values (383, 'Isaac');
insert into PERSON (p_id, p_name)
values (384, 'Sheena');
insert into PERSON (p_id, p_name)
values (385, 'Rhys');
insert into PERSON (p_id, p_name)
values (386, 'Kim');
insert into PERSON (p_id, p_name)
values (387, 'Rutger');
insert into PERSON (p_id, p_name)
values (388, 'France');
insert into PERSON (p_id, p_name)
values (389, 'Miles');
insert into PERSON (p_id, p_name)
values (390, 'Fairuza');
insert into PERSON (p_id, p_name)
values (391, 'Taylor');
insert into PERSON (p_id, p_name)
values (392, 'Juan');
insert into PERSON (p_id, p_name)
values (393, 'Hazel');
insert into PERSON (p_id, p_name)
values (394, 'Aidan');
insert into PERSON (p_id, p_name)
values (395, 'Peabo');
insert into PERSON (p_id, p_name)
values (396, 'Azucar');
insert into PERSON (p_id, p_name)
values (397, 'Jimmie');
insert into PERSON (p_id, p_name)
values (398, 'Nicole');
insert into PERSON (p_id, p_name)
values (399, 'Natascha');
insert into PERSON (p_id, p_name)
values (400, 'Bonnie');
commit;
prompt 400 records committed...
insert into PERSON (p_id, p_name)
values (401, 'Debby');
insert into PERSON (p_id, p_name)
values (402, 'Oro');
insert into PERSON (p_id, p_name)
values (403, 'Ian');
insert into PERSON (p_id, p_name)
values (404, 'Karen');
insert into PERSON (p_id, p_name)
values (405, 'Leo');
insert into PERSON (p_id, p_name)
values (406, 'Tilda');
insert into PERSON (p_id, p_name)
values (407, 'Jose');
insert into PERSON (p_id, p_name)
values (408, 'Lari');
insert into PERSON (p_id, p_name)
values (409, 'Powers');
insert into PERSON (p_id, p_name)
values (410, 'Scarlett');
insert into PERSON (p_id, p_name)
values (411, 'Nicolas');
insert into PERSON (p_id, p_name)
values (412, 'Delroy');
insert into PERSON (p_id, p_name)
values (413, 'Richie');
insert into PERSON (p_id, p_name)
values (414, 'Nathan');
insert into PERSON (p_id, p_name)
values (415, 'Doug');
insert into PERSON (p_id, p_name)
values (416, 'Gordie');
insert into PERSON (p_id, p_name)
values (417, 'Gordon');
insert into PERSON (p_id, p_name)
values (418, 'Brendan');
insert into PERSON (p_id, p_name)
values (419, 'Elle');
insert into PERSON (p_id, p_name)
values (420, 'Rosanne');
insert into PERSON (p_id, p_name)
values (421, 'Garland');
insert into PERSON (p_id, p_name)
values (422, 'Emily');
insert into PERSON (p_id, p_name)
values (423, 'Rhett');
insert into PERSON (p_id, p_name)
values (424, 'Colm');
insert into PERSON (p_id, p_name)
values (425, 'Mae');
insert into PERSON (p_id, p_name)
values (426, 'Wade');
insert into PERSON (p_id, p_name)
values (427, 'Shannon');
insert into PERSON (p_id, p_name)
values (428, 'Rick');
commit;
prompt 428 records loaded
prompt Loading WORKER...
insert into WORKER (salary, pwo_id)
values (10000, 1);
insert into WORKER (salary, pwo_id)
values (9500, 2);
insert into WORKER (salary, pwo_id)
values (5000, 3);
insert into WORKER (salary, pwo_id)
values (9832, 205);
insert into WORKER (salary, pwo_id)
values (10972, 206);
insert into WORKER (salary, pwo_id)
values (7522, 207);
insert into WORKER (salary, pwo_id)
values (20053, 208);
insert into WORKER (salary, pwo_id)
values (23093, 209);
insert into WORKER (salary, pwo_id)
values (36359, 210);
insert into WORKER (salary, pwo_id)
values (7466, 211);
insert into WORKER (salary, pwo_id)
values (17951, 212);
insert into WORKER (salary, pwo_id)
values (19027, 213);
insert into WORKER (salary, pwo_id)
values (21020, 214);
insert into WORKER (salary, pwo_id)
values (29543, 215);
insert into WORKER (salary, pwo_id)
values (11151, 216);
insert into WORKER (salary, pwo_id)
values (18950, 217);
insert into WORKER (salary, pwo_id)
values (34488, 218);
insert into WORKER (salary, pwo_id)
values (17356, 219);
insert into WORKER (salary, pwo_id)
values (33685, 220);
insert into WORKER (salary, pwo_id)
values (14347, 221);
insert into WORKER (salary, pwo_id)
values (7103, 222);
insert into WORKER (salary, pwo_id)
values (38479, 223);
insert into WORKER (salary, pwo_id)
values (8941, 224);
insert into WORKER (salary, pwo_id)
values (26066, 225);
insert into WORKER (salary, pwo_id)
values (23823, 226);
insert into WORKER (salary, pwo_id)
values (27503, 227);
insert into WORKER (salary, pwo_id)
values (20248, 228);
insert into WORKER (salary, pwo_id)
values (28746, 229);
insert into WORKER (salary, pwo_id)
values (14157, 230);
insert into WORKER (salary, pwo_id)
values (9837, 231);
insert into WORKER (salary, pwo_id)
values (10121, 232);
insert into WORKER (salary, pwo_id)
values (28674, 233);
insert into WORKER (salary, pwo_id)
values (34285, 234);
insert into WORKER (salary, pwo_id)
values (31301, 235);
insert into WORKER (salary, pwo_id)
values (38610, 236);
insert into WORKER (salary, pwo_id)
values (32033, 237);
insert into WORKER (salary, pwo_id)
values (36083, 238);
insert into WORKER (salary, pwo_id)
values (7382, 239);
insert into WORKER (salary, pwo_id)
values (34845, 240);
insert into WORKER (salary, pwo_id)
values (34234, 241);
insert into WORKER (salary, pwo_id)
values (21615, 242);
insert into WORKER (salary, pwo_id)
values (29701, 243);
insert into WORKER (salary, pwo_id)
values (14704, 244);
insert into WORKER (salary, pwo_id)
values (29789, 245);
insert into WORKER (salary, pwo_id)
values (20320, 246);
insert into WORKER (salary, pwo_id)
values (31032, 247);
insert into WORKER (salary, pwo_id)
values (31225, 248);
insert into WORKER (salary, pwo_id)
values (15939, 249);
insert into WORKER (salary, pwo_id)
values (34930, 250);
insert into WORKER (salary, pwo_id)
values (28953, 251);
insert into WORKER (salary, pwo_id)
values (8152, 252);
insert into WORKER (salary, pwo_id)
values (6968, 253);
insert into WORKER (salary, pwo_id)
values (5874, 254);
insert into WORKER (salary, pwo_id)
values (6946, 255);
insert into WORKER (salary, pwo_id)
values (35775, 256);
insert into WORKER (salary, pwo_id)
values (14923, 257);
insert into WORKER (salary, pwo_id)
values (27703, 258);
insert into WORKER (salary, pwo_id)
values (5539, 259);
insert into WORKER (salary, pwo_id)
values (36923, 260);
insert into WORKER (salary, pwo_id)
values (31192, 261);
insert into WORKER (salary, pwo_id)
values (9765, 262);
insert into WORKER (salary, pwo_id)
values (24803, 263);
insert into WORKER (salary, pwo_id)
values (29785, 264);
insert into WORKER (salary, pwo_id)
values (17134, 265);
insert into WORKER (salary, pwo_id)
values (12191, 266);
insert into WORKER (salary, pwo_id)
values (13293, 267);
insert into WORKER (salary, pwo_id)
values (17923, 268);
insert into WORKER (salary, pwo_id)
values (25725, 269);
insert into WORKER (salary, pwo_id)
values (11920, 270);
insert into WORKER (salary, pwo_id)
values (17260, 271);
insert into WORKER (salary, pwo_id)
values (16634, 272);
insert into WORKER (salary, pwo_id)
values (24912, 273);
insert into WORKER (salary, pwo_id)
values (32296, 274);
insert into WORKER (salary, pwo_id)
values (12704, 275);
insert into WORKER (salary, pwo_id)
values (33538, 276);
insert into WORKER (salary, pwo_id)
values (17141, 277);
insert into WORKER (salary, pwo_id)
values (38506, 278);
insert into WORKER (salary, pwo_id)
values (36608, 279);
insert into WORKER (salary, pwo_id)
values (5046, 280);
insert into WORKER (salary, pwo_id)
values (8249, 281);
insert into WORKER (salary, pwo_id)
values (24860, 282);
insert into WORKER (salary, pwo_id)
values (17415, 283);
insert into WORKER (salary, pwo_id)
values (14095, 284);
insert into WORKER (salary, pwo_id)
values (17682, 285);
insert into WORKER (salary, pwo_id)
values (28696, 286);
insert into WORKER (salary, pwo_id)
values (8603, 287);
insert into WORKER (salary, pwo_id)
values (38278, 288);
insert into WORKER (salary, pwo_id)
values (15736, 289);
insert into WORKER (salary, pwo_id)
values (24407, 290);
insert into WORKER (salary, pwo_id)
values (32902, 291);
insert into WORKER (salary, pwo_id)
values (26277, 292);
insert into WORKER (salary, pwo_id)
values (32289, 293);
insert into WORKER (salary, pwo_id)
values (9874, 294);
insert into WORKER (salary, pwo_id)
values (13501, 295);
insert into WORKER (salary, pwo_id)
values (24240, 296);
insert into WORKER (salary, pwo_id)
values (25196, 297);
insert into WORKER (salary, pwo_id)
values (11311, 298);
insert into WORKER (salary, pwo_id)
values (32340, 299);
insert into WORKER (salary, pwo_id)
values (12465, 300);
insert into WORKER (salary, pwo_id)
values (15340, 301);
commit;
prompt 100 records committed...
insert into WORKER (salary, pwo_id)
values (21280, 302);
insert into WORKER (salary, pwo_id)
values (9260, 303);
insert into WORKER (salary, pwo_id)
values (31573, 304);
insert into WORKER (salary, pwo_id)
values (24007, 305);
insert into WORKER (salary, pwo_id)
values (33414, 306);
insert into WORKER (salary, pwo_id)
values (39666, 307);
insert into WORKER (salary, pwo_id)
values (31023, 308);
insert into WORKER (salary, pwo_id)
values (22062, 309);
insert into WORKER (salary, pwo_id)
values (31087, 310);
insert into WORKER (salary, pwo_id)
values (11949, 311);
insert into WORKER (salary, pwo_id)
values (36639, 312);
insert into WORKER (salary, pwo_id)
values (39114, 313);
insert into WORKER (salary, pwo_id)
values (6067, 314);
insert into WORKER (salary, pwo_id)
values (39821, 315);
insert into WORKER (salary, pwo_id)
values (17517, 316);
insert into WORKER (salary, pwo_id)
values (29633, 317);
insert into WORKER (salary, pwo_id)
values (21916, 318);
insert into WORKER (salary, pwo_id)
values (33330, 319);
insert into WORKER (salary, pwo_id)
values (31467, 320);
insert into WORKER (salary, pwo_id)
values (11720, 321);
insert into WORKER (salary, pwo_id)
values (30626, 322);
insert into WORKER (salary, pwo_id)
values (31177, 323);
insert into WORKER (salary, pwo_id)
values (11875, 324);
insert into WORKER (salary, pwo_id)
values (22976, 325);
insert into WORKER (salary, pwo_id)
values (34801, 326);
insert into WORKER (salary, pwo_id)
values (20636, 327);
insert into WORKER (salary, pwo_id)
values (37627, 328);
insert into WORKER (salary, pwo_id)
values (6680, 329);
insert into WORKER (salary, pwo_id)
values (6363, 330);
insert into WORKER (salary, pwo_id)
values (10164, 331);
insert into WORKER (salary, pwo_id)
values (11482, 332);
insert into WORKER (salary, pwo_id)
values (30237, 333);
insert into WORKER (salary, pwo_id)
values (31570, 334);
insert into WORKER (salary, pwo_id)
values (8536, 335);
insert into WORKER (salary, pwo_id)
values (26046, 336);
insert into WORKER (salary, pwo_id)
values (21569, 337);
insert into WORKER (salary, pwo_id)
values (5841, 338);
insert into WORKER (salary, pwo_id)
values (28071, 339);
insert into WORKER (salary, pwo_id)
values (10214, 340);
insert into WORKER (salary, pwo_id)
values (37949, 341);
insert into WORKER (salary, pwo_id)
values (30683, 342);
insert into WORKER (salary, pwo_id)
values (28283, 343);
insert into WORKER (salary, pwo_id)
values (22758, 344);
insert into WORKER (salary, pwo_id)
values (25435, 345);
insert into WORKER (salary, pwo_id)
values (13703, 346);
insert into WORKER (salary, pwo_id)
values (5039, 347);
insert into WORKER (salary, pwo_id)
values (13406, 348);
insert into WORKER (salary, pwo_id)
values (30888, 349);
insert into WORKER (salary, pwo_id)
values (26497, 350);
insert into WORKER (salary, pwo_id)
values (19049, 351);
insert into WORKER (salary, pwo_id)
values (15596, 352);
insert into WORKER (salary, pwo_id)
values (17258, 353);
insert into WORKER (salary, pwo_id)
values (8912, 354);
insert into WORKER (salary, pwo_id)
values (36251, 355);
insert into WORKER (salary, pwo_id)
values (28763, 356);
insert into WORKER (salary, pwo_id)
values (16612, 357);
insert into WORKER (salary, pwo_id)
values (6968, 358);
insert into WORKER (salary, pwo_id)
values (21456, 359);
insert into WORKER (salary, pwo_id)
values (11818, 360);
insert into WORKER (salary, pwo_id)
values (34078, 361);
insert into WORKER (salary, pwo_id)
values (5427, 362);
insert into WORKER (salary, pwo_id)
values (35290, 363);
insert into WORKER (salary, pwo_id)
values (33206, 364);
insert into WORKER (salary, pwo_id)
values (34691, 365);
insert into WORKER (salary, pwo_id)
values (34803, 366);
insert into WORKER (salary, pwo_id)
values (23286, 367);
insert into WORKER (salary, pwo_id)
values (36672, 368);
insert into WORKER (salary, pwo_id)
values (38818, 369);
insert into WORKER (salary, pwo_id)
values (16309, 370);
insert into WORKER (salary, pwo_id)
values (9702, 371);
insert into WORKER (salary, pwo_id)
values (20650, 372);
insert into WORKER (salary, pwo_id)
values (10623, 373);
insert into WORKER (salary, pwo_id)
values (7024, 374);
insert into WORKER (salary, pwo_id)
values (17381, 375);
insert into WORKER (salary, pwo_id)
values (37893, 376);
insert into WORKER (salary, pwo_id)
values (37792, 377);
insert into WORKER (salary, pwo_id)
values (11274, 378);
insert into WORKER (salary, pwo_id)
values (23744, 379);
insert into WORKER (salary, pwo_id)
values (25735, 380);
insert into WORKER (salary, pwo_id)
values (14435, 381);
insert into WORKER (salary, pwo_id)
values (38007, 382);
insert into WORKER (salary, pwo_id)
values (26734, 383);
insert into WORKER (salary, pwo_id)
values (11151, 384);
insert into WORKER (salary, pwo_id)
values (7909, 385);
insert into WORKER (salary, pwo_id)
values (7678, 386);
insert into WORKER (salary, pwo_id)
values (23304, 387);
insert into WORKER (salary, pwo_id)
values (18472, 388);
insert into WORKER (salary, pwo_id)
values (13979, 389);
insert into WORKER (salary, pwo_id)
values (30913, 390);
insert into WORKER (salary, pwo_id)
values (26758, 391);
insert into WORKER (salary, pwo_id)
values (31423, 392);
insert into WORKER (salary, pwo_id)
values (18550, 393);
insert into WORKER (salary, pwo_id)
values (14941, 394);
insert into WORKER (salary, pwo_id)
values (13032, 395);
insert into WORKER (salary, pwo_id)
values (19849, 396);
insert into WORKER (salary, pwo_id)
values (32904, 397);
insert into WORKER (salary, pwo_id)
values (12602, 398);
insert into WORKER (salary, pwo_id)
values (9755, 399);
insert into WORKER (salary, pwo_id)
values (15304, 400);
insert into WORKER (salary, pwo_id)
values (23146, 401);
commit;
prompt 200 records committed...
insert into WORKER (salary, pwo_id)
values (7408, 402);
insert into WORKER (salary, pwo_id)
values (25641, 403);
insert into WORKER (salary, pwo_id)
values (18356, 404);
insert into WORKER (salary, pwo_id)
values (13327, 405);
insert into WORKER (salary, pwo_id)
values (6951, 406);
insert into WORKER (salary, pwo_id)
values (16565, 407);
insert into WORKER (salary, pwo_id)
values (19269, 408);
insert into WORKER (salary, pwo_id)
values (20432, 409);
insert into WORKER (salary, pwo_id)
values (30650, 410);
insert into WORKER (salary, pwo_id)
values (23398, 411);
insert into WORKER (salary, pwo_id)
values (37462, 412);
insert into WORKER (salary, pwo_id)
values (13187, 413);
insert into WORKER (salary, pwo_id)
values (6623, 414);
insert into WORKER (salary, pwo_id)
values (30404, 415);
insert into WORKER (salary, pwo_id)
values (23853, 416);
insert into WORKER (salary, pwo_id)
values (25401, 417);
insert into WORKER (salary, pwo_id)
values (21193, 418);
insert into WORKER (salary, pwo_id)
values (11814, 419);
insert into WORKER (salary, pwo_id)
values (39020, 420);
commit;
prompt 219 records loaded
prompt Loading WAITER...
insert into WAITER (seniority, pw_id)
values (5, 1);
insert into WAITER (seniority, pw_id)
values (4, 2);
insert into WAITER (seniority, pw_id)
values (2, 3);
insert into WAITER (seniority, pw_id)
values (20, 205);
insert into WAITER (seniority, pw_id)
values (11, 206);
insert into WAITER (seniority, pw_id)
values (9, 207);
insert into WAITER (seniority, pw_id)
values (9, 208);
insert into WAITER (seniority, pw_id)
values (10, 209);
insert into WAITER (seniority, pw_id)
values (19, 210);
insert into WAITER (seniority, pw_id)
values (20, 211);
insert into WAITER (seniority, pw_id)
values (0, 212);
insert into WAITER (seniority, pw_id)
values (10, 213);
insert into WAITER (seniority, pw_id)
values (1, 214);
insert into WAITER (seniority, pw_id)
values (17, 215);
insert into WAITER (seniority, pw_id)
values (3, 216);
insert into WAITER (seniority, pw_id)
values (4, 217);
insert into WAITER (seniority, pw_id)
values (19, 218);
insert into WAITER (seniority, pw_id)
values (6, 219);
insert into WAITER (seniority, pw_id)
values (14, 220);
insert into WAITER (seniority, pw_id)
values (17, 221);
insert into WAITER (seniority, pw_id)
values (7, 222);
insert into WAITER (seniority, pw_id)
values (8, 223);
insert into WAITER (seniority, pw_id)
values (11, 224);
insert into WAITER (seniority, pw_id)
values (7, 225);
insert into WAITER (seniority, pw_id)
values (18, 226);
insert into WAITER (seniority, pw_id)
values (17, 227);
insert into WAITER (seniority, pw_id)
values (9, 228);
insert into WAITER (seniority, pw_id)
values (20, 229);
insert into WAITER (seniority, pw_id)
values (11, 230);
insert into WAITER (seniority, pw_id)
values (5, 231);
insert into WAITER (seniority, pw_id)
values (13, 232);
insert into WAITER (seniority, pw_id)
values (9, 233);
insert into WAITER (seniority, pw_id)
values (15, 234);
insert into WAITER (seniority, pw_id)
values (4, 235);
insert into WAITER (seniority, pw_id)
values (13, 236);
insert into WAITER (seniority, pw_id)
values (5, 237);
insert into WAITER (seniority, pw_id)
values (6, 238);
insert into WAITER (seniority, pw_id)
values (10, 239);
insert into WAITER (seniority, pw_id)
values (3, 240);
insert into WAITER (seniority, pw_id)
values (2, 241);
insert into WAITER (seniority, pw_id)
values (11, 242);
insert into WAITER (seniority, pw_id)
values (0, 243);
insert into WAITER (seniority, pw_id)
values (20, 244);
insert into WAITER (seniority, pw_id)
values (20, 245);
insert into WAITER (seniority, pw_id)
values (1, 246);
insert into WAITER (seniority, pw_id)
values (17, 247);
insert into WAITER (seniority, pw_id)
values (8, 248);
insert into WAITER (seniority, pw_id)
values (16, 249);
insert into WAITER (seniority, pw_id)
values (4, 250);
insert into WAITER (seniority, pw_id)
values (13, 251);
insert into WAITER (seniority, pw_id)
values (4, 252);
insert into WAITER (seniority, pw_id)
values (17, 253);
insert into WAITER (seniority, pw_id)
values (1, 254);
insert into WAITER (seniority, pw_id)
values (9, 255);
insert into WAITER (seniority, pw_id)
values (2, 256);
insert into WAITER (seniority, pw_id)
values (0, 257);
insert into WAITER (seniority, pw_id)
values (15, 258);
insert into WAITER (seniority, pw_id)
values (8, 259);
insert into WAITER (seniority, pw_id)
values (0, 260);
insert into WAITER (seniority, pw_id)
values (11, 261);
insert into WAITER (seniority, pw_id)
values (13, 262);
insert into WAITER (seniority, pw_id)
values (0, 263);
insert into WAITER (seniority, pw_id)
values (3, 264);
insert into WAITER (seniority, pw_id)
values (6, 265);
insert into WAITER (seniority, pw_id)
values (3, 266);
insert into WAITER (seniority, pw_id)
values (14, 267);
insert into WAITER (seniority, pw_id)
values (6, 268);
insert into WAITER (seniority, pw_id)
values (5, 269);
insert into WAITER (seniority, pw_id)
values (14, 270);
insert into WAITER (seniority, pw_id)
values (7, 271);
insert into WAITER (seniority, pw_id)
values (17, 272);
insert into WAITER (seniority, pw_id)
values (10, 273);
insert into WAITER (seniority, pw_id)
values (18, 274);
insert into WAITER (seniority, pw_id)
values (4, 275);
insert into WAITER (seniority, pw_id)
values (15, 276);
insert into WAITER (seniority, pw_id)
values (8, 277);
insert into WAITER (seniority, pw_id)
values (10, 278);
insert into WAITER (seniority, pw_id)
values (16, 279);
insert into WAITER (seniority, pw_id)
values (1, 280);
insert into WAITER (seniority, pw_id)
values (13, 281);
insert into WAITER (seniority, pw_id)
values (1, 282);
insert into WAITER (seniority, pw_id)
values (4, 283);
insert into WAITER (seniority, pw_id)
values (16, 284);
insert into WAITER (seniority, pw_id)
values (8, 285);
insert into WAITER (seniority, pw_id)
values (0, 286);
insert into WAITER (seniority, pw_id)
values (16, 287);
insert into WAITER (seniority, pw_id)
values (14, 288);
insert into WAITER (seniority, pw_id)
values (12, 289);
insert into WAITER (seniority, pw_id)
values (7, 290);
insert into WAITER (seniority, pw_id)
values (20, 291);
insert into WAITER (seniority, pw_id)
values (15, 292);
insert into WAITER (seniority, pw_id)
values (7, 293);
insert into WAITER (seniority, pw_id)
values (2, 294);
insert into WAITER (seniority, pw_id)
values (10, 295);
insert into WAITER (seniority, pw_id)
values (2, 296);
insert into WAITER (seniority, pw_id)
values (1, 297);
insert into WAITER (seniority, pw_id)
values (7, 298);
insert into WAITER (seniority, pw_id)
values (18, 299);
insert into WAITER (seniority, pw_id)
values (6, 300);
insert into WAITER (seniority, pw_id)
values (20, 301);
commit;
prompt 100 records committed...
insert into WAITER (seniority, pw_id)
values (14, 302);
insert into WAITER (seniority, pw_id)
values (12, 303);
insert into WAITER (seniority, pw_id)
values (1, 304);
commit;
prompt 103 records loaded
prompt Loading CLIENT...
insert into CLIENT (c_phone, pc_id)
values ('0508999228', 4);
insert into CLIENT (c_phone, pc_id)
values ('0503666712', 5);
insert into CLIENT (c_phone, pc_id)
values ('0501984783', 6);
insert into CLIENT (c_phone, pc_id)
values ('0509451411', 7);
insert into CLIENT (c_phone, pc_id)
values ('0508871488', 8);
insert into CLIENT (c_phone, pc_id)
values ('0505846318', 9);
insert into CLIENT (c_phone, pc_id)
values ('0503516532', 10);
insert into CLIENT (c_phone, pc_id)
values ('0508285415', 11);
insert into CLIENT (c_phone, pc_id)
values ('0505829236', 12);
insert into CLIENT (c_phone, pc_id)
values ('0505985977', 13);
insert into CLIENT (c_phone, pc_id)
values ('0504659397', 14);
insert into CLIENT (c_phone, pc_id)
values ('0506476363', 15);
insert into CLIENT (c_phone, pc_id)
values ('0505758137', 16);
insert into CLIENT (c_phone, pc_id)
values ('0502436244', 17);
insert into CLIENT (c_phone, pc_id)
values ('0505586774', 18);
insert into CLIENT (c_phone, pc_id)
values ('0506448962', 19);
insert into CLIENT (c_phone, pc_id)
values ('0502465791', 20);
insert into CLIENT (c_phone, pc_id)
values ('0506144757', 21);
insert into CLIENT (c_phone, pc_id)
values ('0502752127', 22);
insert into CLIENT (c_phone, pc_id)
values ('0509325393', 23);
insert into CLIENT (c_phone, pc_id)
values ('0501924137', 24);
insert into CLIENT (c_phone, pc_id)
values ('0505519747', 25);
insert into CLIENT (c_phone, pc_id)
values ('0505353583', 26);
insert into CLIENT (c_phone, pc_id)
values ('0502568425', 27);
insert into CLIENT (c_phone, pc_id)
values ('0501356594', 28);
insert into CLIENT (c_phone, pc_id)
values ('0503465312', 29);
insert into CLIENT (c_phone, pc_id)
values ('0509559752', 30);
insert into CLIENT (c_phone, pc_id)
values ('0508517814', 31);
insert into CLIENT (c_phone, pc_id)
values ('0507225393', 32);
insert into CLIENT (c_phone, pc_id)
values ('0505748751', 33);
insert into CLIENT (c_phone, pc_id)
values ('0503448474', 34);
insert into CLIENT (c_phone, pc_id)
values ('0506244479', 35);
insert into CLIENT (c_phone, pc_id)
values ('0508396421', 36);
insert into CLIENT (c_phone, pc_id)
values ('0503648358', 37);
insert into CLIENT (c_phone, pc_id)
values ('0502682613', 38);
insert into CLIENT (c_phone, pc_id)
values ('0503776842', 39);
insert into CLIENT (c_phone, pc_id)
values ('0502353942', 40);
insert into CLIENT (c_phone, pc_id)
values ('0504791926', 41);
insert into CLIENT (c_phone, pc_id)
values ('0504693489', 42);
insert into CLIENT (c_phone, pc_id)
values ('0504673264', 43);
insert into CLIENT (c_phone, pc_id)
values ('0504145361', 44);
insert into CLIENT (c_phone, pc_id)
values ('0507228677', 45);
insert into CLIENT (c_phone, pc_id)
values ('0502776335', 46);
insert into CLIENT (c_phone, pc_id)
values ('0503442182', 47);
insert into CLIENT (c_phone, pc_id)
values ('0501371437', 48);
insert into CLIENT (c_phone, pc_id)
values ('0501416994', 49);
insert into CLIENT (c_phone, pc_id)
values ('0509792165', 50);
insert into CLIENT (c_phone, pc_id)
values ('0501479173', 51);
insert into CLIENT (c_phone, pc_id)
values ('0502551754', 52);
insert into CLIENT (c_phone, pc_id)
values ('0506164981', 53);
insert into CLIENT (c_phone, pc_id)
values ('0502766798', 54);
insert into CLIENT (c_phone, pc_id)
values ('0501284843', 55);
insert into CLIENT (c_phone, pc_id)
values ('0505783876', 56);
insert into CLIENT (c_phone, pc_id)
values ('0508686628', 57);
insert into CLIENT (c_phone, pc_id)
values ('0506516367', 58);
insert into CLIENT (c_phone, pc_id)
values ('0505868164', 59);
insert into CLIENT (c_phone, pc_id)
values ('0508596483', 60);
insert into CLIENT (c_phone, pc_id)
values ('0506776755', 61);
insert into CLIENT (c_phone, pc_id)
values ('0501747331', 62);
insert into CLIENT (c_phone, pc_id)
values ('0503358534', 63);
insert into CLIENT (c_phone, pc_id)
values ('0508228855', 64);
insert into CLIENT (c_phone, pc_id)
values ('0506552185', 65);
insert into CLIENT (c_phone, pc_id)
values ('0505738366', 66);
insert into CLIENT (c_phone, pc_id)
values ('0502738441', 67);
insert into CLIENT (c_phone, pc_id)
values ('0505999864', 68);
insert into CLIENT (c_phone, pc_id)
values ('0509128895', 69);
insert into CLIENT (c_phone, pc_id)
values ('0506797375', 70);
insert into CLIENT (c_phone, pc_id)
values ('0501225575', 71);
insert into CLIENT (c_phone, pc_id)
values ('0509892696', 72);
insert into CLIENT (c_phone, pc_id)
values ('0506774378', 73);
insert into CLIENT (c_phone, pc_id)
values ('0509426962', 74);
insert into CLIENT (c_phone, pc_id)
values ('0502296177', 75);
insert into CLIENT (c_phone, pc_id)
values ('0503454327', 76);
insert into CLIENT (c_phone, pc_id)
values ('0505791617', 77);
insert into CLIENT (c_phone, pc_id)
values ('0502747848', 78);
insert into CLIENT (c_phone, pc_id)
values ('0506687499', 79);
insert into CLIENT (c_phone, pc_id)
values ('0509445816', 80);
insert into CLIENT (c_phone, pc_id)
values ('0505176896', 81);
insert into CLIENT (c_phone, pc_id)
values ('0508833585', 82);
insert into CLIENT (c_phone, pc_id)
values ('0508472544', 83);
insert into CLIENT (c_phone, pc_id)
values ('0505766584', 84);
insert into CLIENT (c_phone, pc_id)
values ('0508572862', 85);
insert into CLIENT (c_phone, pc_id)
values ('0507211886', 86);
insert into CLIENT (c_phone, pc_id)
values ('0502461137', 87);
insert into CLIENT (c_phone, pc_id)
values ('0504734982', 88);
insert into CLIENT (c_phone, pc_id)
values ('0507377727', 89);
insert into CLIENT (c_phone, pc_id)
values ('0508681313', 90);
insert into CLIENT (c_phone, pc_id)
values ('0509533926', 91);
insert into CLIENT (c_phone, pc_id)
values ('0504369323', 92);
insert into CLIENT (c_phone, pc_id)
values ('0508363918', 93);
insert into CLIENT (c_phone, pc_id)
values ('0509749638', 94);
insert into CLIENT (c_phone, pc_id)
values ('0505866253', 95);
insert into CLIENT (c_phone, pc_id)
values ('0509847728', 96);
insert into CLIENT (c_phone, pc_id)
values ('0503169994', 97);
insert into CLIENT (c_phone, pc_id)
values ('0508647593', 98);
insert into CLIENT (c_phone, pc_id)
values ('0503853496', 99);
insert into CLIENT (c_phone, pc_id)
values ('0502127695', 100);
insert into CLIENT (c_phone, pc_id)
values ('0507548794', 101);
insert into CLIENT (c_phone, pc_id)
values ('0506751686', 102);
insert into CLIENT (c_phone, pc_id)
values ('0507296564', 103);
commit;
prompt 100 records committed...
insert into CLIENT (c_phone, pc_id)
values ('0507888443', 104);
insert into CLIENT (c_phone, pc_id)
values ('0504737535', 105);
insert into CLIENT (c_phone, pc_id)
values ('0501775244', 106);
insert into CLIENT (c_phone, pc_id)
values ('0507251597', 107);
insert into CLIENT (c_phone, pc_id)
values ('0505521523', 108);
insert into CLIENT (c_phone, pc_id)
values ('0502521975', 109);
insert into CLIENT (c_phone, pc_id)
values ('0508757494', 110);
insert into CLIENT (c_phone, pc_id)
values ('0505513142', 111);
insert into CLIENT (c_phone, pc_id)
values ('0508639975', 112);
insert into CLIENT (c_phone, pc_id)
values ('0509917719', 113);
insert into CLIENT (c_phone, pc_id)
values ('0509481458', 114);
insert into CLIENT (c_phone, pc_id)
values ('0506124789', 115);
insert into CLIENT (c_phone, pc_id)
values ('0508863791', 116);
insert into CLIENT (c_phone, pc_id)
values ('0507277186', 117);
insert into CLIENT (c_phone, pc_id)
values ('0507345211', 118);
insert into CLIENT (c_phone, pc_id)
values ('0506759187', 119);
insert into CLIENT (c_phone, pc_id)
values ('0505952946', 120);
insert into CLIENT (c_phone, pc_id)
values ('0501564747', 121);
insert into CLIENT (c_phone, pc_id)
values ('0506449882', 122);
insert into CLIENT (c_phone, pc_id)
values ('0504254967', 123);
insert into CLIENT (c_phone, pc_id)
values ('0507319681', 124);
insert into CLIENT (c_phone, pc_id)
values ('0501568477', 125);
insert into CLIENT (c_phone, pc_id)
values ('0508812421', 126);
insert into CLIENT (c_phone, pc_id)
values ('0507239114', 127);
insert into CLIENT (c_phone, pc_id)
values ('0505188123', 128);
insert into CLIENT (c_phone, pc_id)
values ('0505163635', 129);
insert into CLIENT (c_phone, pc_id)
values ('0507974414', 130);
insert into CLIENT (c_phone, pc_id)
values ('0501615176', 131);
insert into CLIENT (c_phone, pc_id)
values ('0507621998', 132);
insert into CLIENT (c_phone, pc_id)
values ('0501675478', 133);
insert into CLIENT (c_phone, pc_id)
values ('0502356638', 134);
insert into CLIENT (c_phone, pc_id)
values ('0502339658', 135);
insert into CLIENT (c_phone, pc_id)
values ('0509988155', 136);
insert into CLIENT (c_phone, pc_id)
values ('0506114185', 137);
insert into CLIENT (c_phone, pc_id)
values ('0506842822', 138);
insert into CLIENT (c_phone, pc_id)
values ('0508169614', 139);
insert into CLIENT (c_phone, pc_id)
values ('0503666789', 140);
insert into CLIENT (c_phone, pc_id)
values ('0501962816', 141);
insert into CLIENT (c_phone, pc_id)
values ('0505143346', 142);
insert into CLIENT (c_phone, pc_id)
values ('0507665538', 143);
insert into CLIENT (c_phone, pc_id)
values ('0509415297', 144);
insert into CLIENT (c_phone, pc_id)
values ('0508691142', 145);
insert into CLIENT (c_phone, pc_id)
values ('0504591678', 146);
insert into CLIENT (c_phone, pc_id)
values ('0504379237', 147);
insert into CLIENT (c_phone, pc_id)
values ('0507257644', 148);
insert into CLIENT (c_phone, pc_id)
values ('0503246172', 149);
insert into CLIENT (c_phone, pc_id)
values ('0508148997', 150);
insert into CLIENT (c_phone, pc_id)
values ('0503832538', 151);
insert into CLIENT (c_phone, pc_id)
values ('0504941291', 152);
insert into CLIENT (c_phone, pc_id)
values ('0509558224', 153);
insert into CLIENT (c_phone, pc_id)
values ('0509357511', 154);
insert into CLIENT (c_phone, pc_id)
values ('0505938915', 155);
insert into CLIENT (c_phone, pc_id)
values ('0509692311', 156);
insert into CLIENT (c_phone, pc_id)
values ('0507341679', 157);
insert into CLIENT (c_phone, pc_id)
values ('0509686267', 158);
insert into CLIENT (c_phone, pc_id)
values ('0509417724', 159);
insert into CLIENT (c_phone, pc_id)
values ('0509987328', 160);
insert into CLIENT (c_phone, pc_id)
values ('0502415264', 161);
insert into CLIENT (c_phone, pc_id)
values ('0507979724', 162);
insert into CLIENT (c_phone, pc_id)
values ('0503153513', 163);
insert into CLIENT (c_phone, pc_id)
values ('0505262455', 164);
insert into CLIENT (c_phone, pc_id)
values ('0505924754', 165);
insert into CLIENT (c_phone, pc_id)
values ('0501769174', 166);
insert into CLIENT (c_phone, pc_id)
values ('0508247887', 167);
insert into CLIENT (c_phone, pc_id)
values ('0507626711', 168);
insert into CLIENT (c_phone, pc_id)
values ('0509471346', 169);
insert into CLIENT (c_phone, pc_id)
values ('0504819369', 170);
insert into CLIENT (c_phone, pc_id)
values ('0509265277', 171);
insert into CLIENT (c_phone, pc_id)
values ('0501442758', 172);
insert into CLIENT (c_phone, pc_id)
values ('0504113889', 173);
insert into CLIENT (c_phone, pc_id)
values ('0501833987', 174);
insert into CLIENT (c_phone, pc_id)
values ('0503935317', 175);
insert into CLIENT (c_phone, pc_id)
values ('0508799498', 176);
insert into CLIENT (c_phone, pc_id)
values ('0501471792', 177);
insert into CLIENT (c_phone, pc_id)
values ('0509158953', 178);
insert into CLIENT (c_phone, pc_id)
values ('0509754732', 179);
insert into CLIENT (c_phone, pc_id)
values ('0509364836', 180);
insert into CLIENT (c_phone, pc_id)
values ('0503246915', 181);
insert into CLIENT (c_phone, pc_id)
values ('0503685732', 182);
insert into CLIENT (c_phone, pc_id)
values ('0508924386', 183);
insert into CLIENT (c_phone, pc_id)
values ('0504136297', 184);
insert into CLIENT (c_phone, pc_id)
values ('0505784768', 185);
insert into CLIENT (c_phone, pc_id)
values ('0501559136', 186);
insert into CLIENT (c_phone, pc_id)
values ('0501394971', 187);
insert into CLIENT (c_phone, pc_id)
values ('0502883474', 188);
insert into CLIENT (c_phone, pc_id)
values ('0502354684', 189);
insert into CLIENT (c_phone, pc_id)
values ('0508537596', 190);
insert into CLIENT (c_phone, pc_id)
values ('0505198834', 191);
insert into CLIENT (c_phone, pc_id)
values ('0503871916', 192);
insert into CLIENT (c_phone, pc_id)
values ('0501312113', 193);
insert into CLIENT (c_phone, pc_id)
values ('0502293165', 194);
insert into CLIENT (c_phone, pc_id)
values ('0508149547', 195);
insert into CLIENT (c_phone, pc_id)
values ('0505526183', 196);
insert into CLIENT (c_phone, pc_id)
values ('0506439436', 197);
insert into CLIENT (c_phone, pc_id)
values ('0506884141', 198);
insert into CLIENT (c_phone, pc_id)
values ('0508649616', 199);
insert into CLIENT (c_phone, pc_id)
values ('0502718484', 200);
insert into CLIENT (c_phone, pc_id)
values ('0506693696', 201);
insert into CLIENT (c_phone, pc_id)
values ('0504521697', 202);
insert into CLIENT (c_phone, pc_id)
values ('0503736637', 203);
commit;
prompt 200 records loaded
prompt Loading ORDERR...
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('16-03-2022', 'dd-mm-yyyy'), 1, 105, 229);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('06-02-2023', 'dd-mm-yyyy'), 2, 176, 288);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('30-04-2023', 'dd-mm-yyyy'), 3, 18, 243);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('23-01-2023', 'dd-mm-yyyy'), 4, 135, 251);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('30-12-2022', 'dd-mm-yyyy'), 5, 118, 290);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('13-10-2022', 'dd-mm-yyyy'), 6, 67, 297);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('27-03-2023', 'dd-mm-yyyy'), 7, 53, 241);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('18-09-2024', 'dd-mm-yyyy'), 8, 44, 251);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('22-07-2023', 'dd-mm-yyyy'), 9, 172, 1);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('14-06-2023', 'dd-mm-yyyy'), 10, 13, 205);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('30-11-2024', 'dd-mm-yyyy'), 11, 195, 253);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('13-03-2024', 'dd-mm-yyyy'), 12, 50, 259);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('25-07-2023', 'dd-mm-yyyy'), 13, 140, 220);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('24-04-2023', 'dd-mm-yyyy'), 14, 169, 205);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('17-06-2024', 'dd-mm-yyyy'), 15, 141, 261);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('28-09-2024', 'dd-mm-yyyy'), 16, 53, 296);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('03-06-2023', 'dd-mm-yyyy'), 17, 199, 220);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('13-08-2023', 'dd-mm-yyyy'), 18, 93, 274);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('03-03-2022', 'dd-mm-yyyy'), 19, 122, 287);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('22-11-2022', 'dd-mm-yyyy'), 20, 42, 211);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('21-12-2022', 'dd-mm-yyyy'), 21, 77, 300);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('04-08-2022', 'dd-mm-yyyy'), 22, 41, 288);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('31-12-2024', 'dd-mm-yyyy'), 23, 176, 243);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('29-04-2024', 'dd-mm-yyyy'), 24, 187, 261);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('13-06-2024', 'dd-mm-yyyy'), 25, 190, 302);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('24-04-2023', 'dd-mm-yyyy'), 26, 98, 243);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('25-02-2024', 'dd-mm-yyyy'), 27, 136, 265);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('10-09-2023', 'dd-mm-yyyy'), 28, 131, 231);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('10-05-2022', 'dd-mm-yyyy'), 29, 37, 219);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('29-12-2023', 'dd-mm-yyyy'), 30, 65, 242);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('19-02-2024', 'dd-mm-yyyy'), 31, 189, 245);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('18-04-2022', 'dd-mm-yyyy'), 32, 95, 270);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('25-07-2022', 'dd-mm-yyyy'), 33, 124, 223);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('03-02-2023', 'dd-mm-yyyy'), 34, 56, 285);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('15-06-2023', 'dd-mm-yyyy'), 35, 93, 251);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('22-05-2023', 'dd-mm-yyyy'), 36, 118, 292);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('09-08-2022', 'dd-mm-yyyy'), 37, 159, 236);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('28-02-2024', 'dd-mm-yyyy'), 38, 44, 288);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('01-10-2024', 'dd-mm-yyyy'), 39, 26, 291);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('20-05-2023', 'dd-mm-yyyy'), 40, 151, 259);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('17-11-2023', 'dd-mm-yyyy'), 41, 86, 231);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('01-05-2023', 'dd-mm-yyyy'), 42, 194, 221);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('08-01-2024', 'dd-mm-yyyy'), 43, 49, 231);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('16-04-2024', 'dd-mm-yyyy'), 44, 5, 275);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('14-04-2024', 'dd-mm-yyyy'), 45, 188, 300);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('12-12-2022', 'dd-mm-yyyy'), 46, 117, 226);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('07-04-2022', 'dd-mm-yyyy'), 47, 55, 234);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('09-03-2024', 'dd-mm-yyyy'), 48, 188, 215);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('25-06-2024', 'dd-mm-yyyy'), 49, 135, 272);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('17-08-2022', 'dd-mm-yyyy'), 50, 10, 222);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('03-09-2022', 'dd-mm-yyyy'), 51, 95, 213);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('11-06-2024', 'dd-mm-yyyy'), 52, 133, 219);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('12-10-2024', 'dd-mm-yyyy'), 53, 118, 261);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('27-10-2023', 'dd-mm-yyyy'), 54, 84, 283);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('24-03-2022', 'dd-mm-yyyy'), 55, 35, 247);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('17-02-2024', 'dd-mm-yyyy'), 56, 137, 282);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('28-05-2023', 'dd-mm-yyyy'), 57, 21, 2);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('29-08-2024', 'dd-mm-yyyy'), 58, 161, 295);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('18-04-2022', 'dd-mm-yyyy'), 59, 157, 225);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('05-10-2023', 'dd-mm-yyyy'), 60, 30, 237);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('03-08-2024', 'dd-mm-yyyy'), 61, 95, 238);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('25-08-2024', 'dd-mm-yyyy'), 62, 147, 230);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('13-08-2023', 'dd-mm-yyyy'), 63, 144, 279);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('19-04-2022', 'dd-mm-yyyy'), 64, 182, 236);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('08-10-2023', 'dd-mm-yyyy'), 65, 172, 263);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('23-06-2023', 'dd-mm-yyyy'), 66, 150, 224);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('26-09-2022', 'dd-mm-yyyy'), 67, 161, 223);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('09-02-2022', 'dd-mm-yyyy'), 68, 172, 218);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('28-10-2024', 'dd-mm-yyyy'), 69, 183, 224);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('27-12-2022', 'dd-mm-yyyy'), 70, 60, 293);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('26-10-2024', 'dd-mm-yyyy'), 71, 180, 251);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('05-04-2024', 'dd-mm-yyyy'), 72, 29, 272);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('18-02-2022', 'dd-mm-yyyy'), 73, 138, 276);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('14-03-2024', 'dd-mm-yyyy'), 74, 44, 264);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('17-05-2022', 'dd-mm-yyyy'), 75, 158, 206);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('08-05-2024', 'dd-mm-yyyy'), 76, 59, 213);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('26-11-2024', 'dd-mm-yyyy'), 77, 194, 259);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('01-10-2023', 'dd-mm-yyyy'), 78, 97, 234);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('23-04-2022', 'dd-mm-yyyy'), 79, 112, 255);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('20-10-2022', 'dd-mm-yyyy'), 80, 85, 237);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('09-01-2022', 'dd-mm-yyyy'), 81, 108, 235);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('23-03-2024', 'dd-mm-yyyy'), 82, 186, 209);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('23-05-2024', 'dd-mm-yyyy'), 83, 9, 236);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('08-04-2022', 'dd-mm-yyyy'), 84, 198, 2);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('03-06-2023', 'dd-mm-yyyy'), 85, 177, 256);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('06-05-2022', 'dd-mm-yyyy'), 86, 26, 221);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('30-12-2022', 'dd-mm-yyyy'), 87, 202, 238);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('06-08-2024', 'dd-mm-yyyy'), 88, 153, 280);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('26-08-2023', 'dd-mm-yyyy'), 89, 73, 235);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('15-10-2023', 'dd-mm-yyyy'), 90, 135, 254);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('21-09-2023', 'dd-mm-yyyy'), 91, 39, 260);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('29-06-2022', 'dd-mm-yyyy'), 92, 6, 246);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('16-03-2022', 'dd-mm-yyyy'), 93, 170, 293);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('03-04-2023', 'dd-mm-yyyy'), 94, 99, 285);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('10-04-2022', 'dd-mm-yyyy'), 95, 84, 215);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('03-11-2023', 'dd-mm-yyyy'), 96, 34, 241);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('20-10-2022', 'dd-mm-yyyy'), 97, 68, 253);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('04-01-2024', 'dd-mm-yyyy'), 98, 5, 238);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('06-09-2022', 'dd-mm-yyyy'), 99, 49, 244);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('27-04-2024', 'dd-mm-yyyy'), 100, 17, 298);
commit;
prompt 100 records committed...
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('27-07-2024', 'dd-mm-yyyy'), 101, 21, 240);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('07-01-2022', 'dd-mm-yyyy'), 102, 54, 221);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('30-09-2022', 'dd-mm-yyyy'), 103, 11, 278);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('12-10-2024', 'dd-mm-yyyy'), 104, 44, 272);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('15-12-2024', 'dd-mm-yyyy'), 105, 66, 292);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('19-05-2024', 'dd-mm-yyyy'), 106, 30, 256);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('22-04-2024', 'dd-mm-yyyy'), 107, 89, 215);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('28-06-2022', 'dd-mm-yyyy'), 108, 8, 230);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('30-09-2024', 'dd-mm-yyyy'), 109, 62, 270);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('16-09-2022', 'dd-mm-yyyy'), 110, 131, 246);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('31-08-2024', 'dd-mm-yyyy'), 111, 61, 205);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('24-03-2023', 'dd-mm-yyyy'), 112, 50, 288);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('16-07-2023', 'dd-mm-yyyy'), 113, 138, 283);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('01-09-2022', 'dd-mm-yyyy'), 114, 131, 272);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('11-05-2024', 'dd-mm-yyyy'), 115, 200, 3);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('18-11-2022', 'dd-mm-yyyy'), 116, 35, 222);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('07-07-2024', 'dd-mm-yyyy'), 117, 54, 299);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('12-10-2024', 'dd-mm-yyyy'), 118, 96, 242);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('08-01-2024', 'dd-mm-yyyy'), 119, 105, 302);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('17-12-2024', 'dd-mm-yyyy'), 120, 4, 238);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('29-05-2023', 'dd-mm-yyyy'), 121, 77, 240);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('04-04-2023', 'dd-mm-yyyy'), 122, 100, 288);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('14-01-2023', 'dd-mm-yyyy'), 123, 110, 297);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('09-03-2023', 'dd-mm-yyyy'), 124, 184, 225);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('31-12-2022', 'dd-mm-yyyy'), 125, 185, 301);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('28-05-2024', 'dd-mm-yyyy'), 126, 83, 268);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('30-04-2024', 'dd-mm-yyyy'), 127, 139, 303);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('13-02-2023', 'dd-mm-yyyy'), 128, 7, 241);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('29-06-2022', 'dd-mm-yyyy'), 129, 80, 277);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('13-12-2023', 'dd-mm-yyyy'), 130, 194, 222);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('07-05-2023', 'dd-mm-yyyy'), 131, 100, 282);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('18-06-2024', 'dd-mm-yyyy'), 132, 27, 222);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('05-09-2024', 'dd-mm-yyyy'), 133, 142, 271);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('24-03-2024', 'dd-mm-yyyy'), 134, 45, 288);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('23-02-2023', 'dd-mm-yyyy'), 135, 179, 232);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('24-06-2024', 'dd-mm-yyyy'), 136, 68, 300);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('27-08-2023', 'dd-mm-yyyy'), 137, 97, 262);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('08-03-2023', 'dd-mm-yyyy'), 138, 145, 246);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('13-03-2022', 'dd-mm-yyyy'), 139, 29, 230);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('05-09-2022', 'dd-mm-yyyy'), 140, 202, 259);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('29-07-2023', 'dd-mm-yyyy'), 141, 34, 250);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('20-07-2024', 'dd-mm-yyyy'), 142, 19, 226);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('17-03-2024', 'dd-mm-yyyy'), 143, 116, 237);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('19-09-2022', 'dd-mm-yyyy'), 144, 191, 301);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('08-09-2022', 'dd-mm-yyyy'), 145, 41, 256);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('10-09-2023', 'dd-mm-yyyy'), 146, 183, 216);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('26-02-2024', 'dd-mm-yyyy'), 147, 120, 260);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('28-02-2022', 'dd-mm-yyyy'), 148, 94, 260);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('10-08-2023', 'dd-mm-yyyy'), 149, 190, 299);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('22-12-2022', 'dd-mm-yyyy'), 150, 201, 274);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('20-04-2024', 'dd-mm-yyyy'), 151, 138, 227);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('26-07-2023', 'dd-mm-yyyy'), 152, 163, 2);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('28-07-2023', 'dd-mm-yyyy'), 153, 58, 290);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('13-08-2023', 'dd-mm-yyyy'), 154, 64, 274);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('22-11-2023', 'dd-mm-yyyy'), 155, 112, 303);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('28-12-2022', 'dd-mm-yyyy'), 156, 38, 229);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('07-03-2023', 'dd-mm-yyyy'), 157, 203, 229);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('16-06-2022', 'dd-mm-yyyy'), 158, 38, 295);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('20-10-2022', 'dd-mm-yyyy'), 159, 108, 240);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('10-12-2022', 'dd-mm-yyyy'), 160, 63, 301);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('04-11-2023', 'dd-mm-yyyy'), 161, 67, 293);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('07-01-2022', 'dd-mm-yyyy'), 162, 119, 245);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('01-05-2023', 'dd-mm-yyyy'), 163, 173, 295);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('05-05-2024', 'dd-mm-yyyy'), 164, 28, 224);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('27-11-2023', 'dd-mm-yyyy'), 165, 56, 1);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('31-10-2023', 'dd-mm-yyyy'), 166, 129, 290);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('02-12-2023', 'dd-mm-yyyy'), 167, 111, 297);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('02-01-2022', 'dd-mm-yyyy'), 168, 74, 250);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('16-03-2024', 'dd-mm-yyyy'), 169, 151, 298);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('21-11-2023', 'dd-mm-yyyy'), 170, 112, 303);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('22-06-2023', 'dd-mm-yyyy'), 171, 176, 266);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('03-10-2022', 'dd-mm-yyyy'), 172, 142, 217);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('20-07-2024', 'dd-mm-yyyy'), 173, 93, 270);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('27-09-2023', 'dd-mm-yyyy'), 174, 139, 285);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('07-08-2022', 'dd-mm-yyyy'), 175, 158, 262);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('18-02-2022', 'dd-mm-yyyy'), 176, 21, 218);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('24-04-2023', 'dd-mm-yyyy'), 177, 19, 282);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('10-07-2023', 'dd-mm-yyyy'), 178, 109, 223);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('25-11-2023', 'dd-mm-yyyy'), 179, 134, 228);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('04-05-2023', 'dd-mm-yyyy'), 180, 77, 238);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('02-03-2024', 'dd-mm-yyyy'), 181, 64, 272);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('03-01-2024', 'dd-mm-yyyy'), 182, 127, 243);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('22-02-2022', 'dd-mm-yyyy'), 183, 60, 232);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('10-11-2023', 'dd-mm-yyyy'), 184, 5, 278);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('16-09-2024', 'dd-mm-yyyy'), 185, 131, 279);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('25-05-2023', 'dd-mm-yyyy'), 186, 164, 215);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('26-12-2023', 'dd-mm-yyyy'), 187, 202, 287);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('01-12-2024', 'dd-mm-yyyy'), 188, 198, 293);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('21-05-2022', 'dd-mm-yyyy'), 189, 27, 2);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('25-06-2022', 'dd-mm-yyyy'), 190, 82, 217);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('05-07-2023', 'dd-mm-yyyy'), 191, 53, 1);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('23-09-2023', 'dd-mm-yyyy'), 192, 165, 289);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('09-01-2023', 'dd-mm-yyyy'), 193, 79, 235);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('10-06-2022', 'dd-mm-yyyy'), 194, 12, 245);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('14-10-2022', 'dd-mm-yyyy'), 195, 43, 232);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('15-02-2024', 'dd-mm-yyyy'), 196, 101, 265);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('05-12-2022', 'dd-mm-yyyy'), 197, 115, 230);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('11-04-2024', 'dd-mm-yyyy'), 198, 81, 227);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('07-04-2022', 'dd-mm-yyyy'), 199, 198, 258);
insert into ORDERR (o_date, o_id, pc_id, pw_id)
values (to_date('11-02-2024', 'dd-mm-yyyy'), 200, 140, 281);
commit;
prompt 200 records loaded
prompt Loading CHOOSEO...
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 1, 200);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 13, 108);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 1, 13);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 22, 66);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 17, 150);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 10, 104);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 1, 134);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 20, 154);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 19, 84);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 3, 13);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 6, 80);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 2, 143);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 2, 29);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 16, 37);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 3, 21);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 16, 154);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 4, 51);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 22, 161);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 22, 182);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 22, 195);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 5, 3);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 11, 161);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 14, 171);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 18, 41);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 5, 20);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 22, 147);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 16, 146);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 14, 166);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 4, 81);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 1, 187);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 21, 176);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 15, 183);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 20, 69);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 21, 184);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 12, 44);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 7, 115);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 10, 166);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 13, 66);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 20, 151);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 7, 58);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 15, 95);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 6, 170);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 9, 66);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 17, 58);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 10, 152);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 19, 156);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 15, 85);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 22, 60);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 9, 43);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 9, 60);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 2, 43);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 6, 44);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 16, 173);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 8, 99);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 20, 45);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 22, 125);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 22, 90);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 2, 151);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 19, 44);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 14, 22);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 7, 32);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 19, 16);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 10, 55);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 2, 161);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 10, 199);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 5, 83);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 5, 22);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 16, 137);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 7, 175);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 16, 13);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 23, 24);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 5, 93);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 16, 30);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 2, 150);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 5, 137);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 23, 29);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 5, 38);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 6, 194);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 21, 148);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 1, 122);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 19, 101);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 23, 183);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 12, 57);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 3, 117);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 7, 132);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 11, 47);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 1, 153);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 17, 80);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 20, 9);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 5, 67);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 15, 83);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 13, 194);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 23, 55);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 9, 94);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 2, 23);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 2, 50);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 23, 133);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 5, 1);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 21, 193);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 2, 160);
commit;
prompt 100 records committed...
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 18, 86);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 23, 148);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 20, 58);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 5, 109);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 15, 4);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 17, 10);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 16, 195);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 23, 150);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 18, 100);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 20, 185);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 15, 135);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 9, 81);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 23, 50);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 9, 62);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 22, 120);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 11, 66);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 18, 73);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 21, 181);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 11, 125);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 3, 66);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 23, 121);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 1, 52);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 6, 164);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 6, 116);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 20, 192);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 10, 134);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 8, 90);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 18, 191);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 6, 51);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 18, 193);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 22, 12);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 14, 139);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 2, 130);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 3, 120);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 3, 38);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 5, 2);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 4, 195);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 12, 59);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 17, 72);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 6, 71);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 6, 33);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 22, 43);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 18, 124);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 6, 120);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 17, 4);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 17, 89);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 19, 46);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 19, 115);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 20, 26);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 21, 188);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 9, 36);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 23, 127);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 11, 146);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 9, 42);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 18, 105);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 3, 115);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 15, 49);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 13, 24);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 9, 99);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 14, 79);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 9, 145);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 18, 31);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 9, 190);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 20, 98);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 1, 36);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 6, 86);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 14, 198);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 16, 68);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 19, 73);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 11, 29);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 22, 14);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 13, 140);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 6, 28);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 19, 18);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 15, 105);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 12, 9);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 17, 53);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 12, 39);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 7, 117);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 14, 128);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 7, 160);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 17, 25);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 16, 159);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 23, 88);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 23, 163);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 4, 41);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 12, 30);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 20, 20);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 21, 40);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 9, 39);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 6, 57);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 12, 176);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 5, 127);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 20, 133);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 23, 93);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 17, 39);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 7, 11);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 8, 198);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 7, 78);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 2, 10);
commit;
prompt 200 records committed...
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 1, 40);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 10, 45);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 14, 180);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 9, 137);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 16, 17);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 7, 82);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 7, 24);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 6, 29);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 10, 87);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 22, 1);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 12, 147);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 2, 114);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 11, 90);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 6, 112);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 1, 63);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 7, 83);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 12, 88);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 7, 155);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 23, 185);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 18, 1);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 9, 44);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 16, 115);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 2, 93);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 8, 194);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 8, 47);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 22, 180);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 18, 88);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 5, 114);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 8, 181);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 22, 48);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 11, 19);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 15, 189);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 9, 117);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 19, 33);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 15, 33);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 16, 156);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 6, 19);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 23, 192);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 1, 114);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 3, 176);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 6, 174);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 19, 196);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 20, 36);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 8, 185);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 3, 102);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 20, 116);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 2, 45);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 9, 49);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 19, 142);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 13, 73);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 2, 184);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 18, 60);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 14, 199);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 18, 6);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 12, 159);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 8, 138);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 8, 169);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 2, 178);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 4, 91);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 7, 69);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 7, 30);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 16, 77);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 3, 59);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 20, 38);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 23, 74);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 3, 19);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 8, 193);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 7, 72);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 14, 41);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 23, 190);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 9, 85);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 8, 56);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 12, 142);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 12, 105);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 13, 135);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 20, 47);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 17, 45);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 13, 141);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 15, 130);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 4, 33);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 23, 110);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 23, 30);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 6, 166);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 12, 173);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 5, 37);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 5, 44);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 7, 107);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 12, 174);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 19, 119);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 16, 75);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 4, 193);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 2, 95);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 15, 107);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 23, 65);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 20, 23);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 8, 77);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 22, 188);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 9, 15);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 21, 43);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 21, 166);
commit;
prompt 300 records committed...
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 3, 65);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 4, 23);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 11, 178);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 17, 90);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 1, 194);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 19, 88);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 19, 168);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 17, 160);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 14, 161);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 19, 164);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 15, 128);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 22, 33);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 16, 43);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 19, 160);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 16, 139);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 9, 30);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 4, 190);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 18, 136);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 8, 200);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 13, 19);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 9, 7);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 23, 106);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 16, 36);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 11, 131);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 5, 113);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 20, 159);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 2, 107);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 3, 132);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 11, 171);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 17, 134);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 6, 82);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 11, 187);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 17, 161);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 21, 112);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 1, 159);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 17, 188);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 16, 178);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 5, 111);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 6, 35);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 9, 91);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 6, 61);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 18, 199);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 13, 93);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 9, 69);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 5, 88);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 11, 120);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 8, 62);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 21, 164);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 19, 189);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 8, 34);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 8, 19);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 9, 10);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 11, 148);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 2, 141);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 13, 154);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 13, 12);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 6, 78);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 19, 39);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 16, 167);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 16, 145);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 14, 63);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (5, 21, 105);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 18, 27);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 8, 183);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 11, 118);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 19, 32);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 19, 75);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (7, 16, 31);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (6, 22, 79);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 15, 118);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 22, 97);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (9, 3, 76);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (4, 18, 64);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 18, 155);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (2, 8, 42);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (3, 4, 114);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (1, 18, 22);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 12, 190);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (10, 21, 122);
insert into CHOOSEO (ch_amount, m_id, o_id)
values (8, 15, 74);
commit;
prompt 380 records loaded
prompt Loading PRODUCT...
insert into PRODUCT (pr_id, p_name, p_price)
values (1, 'Flour', 5);
insert into PRODUCT (pr_id, p_name, p_price)
values (2, 'Eggs', 20);
insert into PRODUCT (pr_id, p_name, p_price)
values (3, 'Potato', 8);
insert into PRODUCT (pr_id, p_name, p_price)
values (4, 'cheese', 30);
insert into PRODUCT (pr_id, p_name, p_price)
values (5, 'Sugar', 15);
insert into PRODUCT (pr_id, p_name, p_price)
values (6, 'Salt', 10);
insert into PRODUCT (pr_id, p_name, p_price)
values (7, 'Mushrooms', 78);
insert into PRODUCT (pr_id, p_name, p_price)
values (8, 'Pumpkin', 11);
insert into PRODUCT (pr_id, p_name, p_price)
values (9, 'Bulgarian chees', 25);
insert into PRODUCT (pr_id, p_name, p_price)
values (10, 'Bulgarian chees', 17);
insert into PRODUCT (pr_id, p_name, p_price)
values (11, 'Chocolate', 39);
insert into PRODUCT (pr_id, p_name, p_price)
values (12, 'onion', 19);
insert into PRODUCT (pr_id, p_name, p_price)
values (13, 'Nuts', 93);
insert into PRODUCT (pr_id, p_name, p_price)
values (14, 'black pepper', 44);
insert into PRODUCT (pr_id, p_name, p_price)
values (15, 'Tomato', 53);
insert into PRODUCT (pr_id, p_name, p_price)
values (16, 'strawberries', 84);
insert into PRODUCT (pr_id, p_name, p_price)
values (17, 'Olives', 89);
insert into PRODUCT (pr_id, p_name, p_price)
values (18, 'oil', 91);
insert into PRODUCT (pr_id, p_name, p_price)
values (19, 'carrot', 12);
insert into PRODUCT (pr_id, p_name, p_price)
values (20, 'baking powder''', 71);
insert into PRODUCT (pr_id, p_name, p_price)
values (21, 'Salmon fish''', 61);
insert into PRODUCT (pr_id, p_name, p_price)
values (22, 'Tomato', 79);
insert into PRODUCT (pr_id, p_name, p_price)
values (23, 'Mushrooms', 11);
insert into PRODUCT (pr_id, p_name, p_price)
values (24, 'black pepper', 91);
insert into PRODUCT (pr_id, p_name, p_price)
values (25, 'Cherry tomatoes', 76);
insert into PRODUCT (pr_id, p_name, p_price)
values (27, 'Cherry tomatoes', 79);
insert into PRODUCT (pr_id, p_name, p_price)
values (28, 'oil', 80);
commit;
prompt 27 records loaded
prompt Loading CONTAINING...
insert into CONTAINING (c_amount, m_id, pr_id)
values (1, 3, 16);
insert into CONTAINING (c_amount, m_id, pr_id)
values (11, 22, 8);
insert into CONTAINING (c_amount, m_id, pr_id)
values (21, 19, 4);
insert into CONTAINING (c_amount, m_id, pr_id)
values (31, 15, 17);
insert into CONTAINING (c_amount, m_id, pr_id)
values (41, 16, 5);
insert into CONTAINING (c_amount, m_id, pr_id)
values (51, 15, 10);
insert into CONTAINING (c_amount, m_id, pr_id)
values (61, 12, 10);
insert into CONTAINING (c_amount, m_id, pr_id)
values (71, 11, 2);
insert into CONTAINING (c_amount, m_id, pr_id)
values (81, 13, 24);
insert into CONTAINING (c_amount, m_id, pr_id)
values (91, 4, 6);
insert into CONTAINING (c_amount, m_id, pr_id)
values (101, 22, 18);
insert into CONTAINING (c_amount, m_id, pr_id)
values (111, 1, 14);
insert into CONTAINING (c_amount, m_id, pr_id)
values (121, 12, 4);
insert into CONTAINING (c_amount, m_id, pr_id)
values (131, 9, 4);
insert into CONTAINING (c_amount, m_id, pr_id)
values (141, 20, 14);
insert into CONTAINING (c_amount, m_id, pr_id)
values (151, 18, 22);
insert into CONTAINING (c_amount, m_id, pr_id)
values (161, 16, 8);
insert into CONTAINING (c_amount, m_id, pr_id)
values (171, 4, 2);
insert into CONTAINING (c_amount, m_id, pr_id)
values (181, 7, 1);
insert into CONTAINING (c_amount, m_id, pr_id)
values (191, 14, 21);
insert into CONTAINING (c_amount, m_id, pr_id)
values (201, 9, 21);
insert into CONTAINING (c_amount, m_id, pr_id)
values (211, 12, 14);
insert into CONTAINING (c_amount, m_id, pr_id)
values (221, 13, 9);
insert into CONTAINING (c_amount, m_id, pr_id)
values (231, 16, 25);
insert into CONTAINING (c_amount, m_id, pr_id)
values (241, 4, 23);
insert into CONTAINING (c_amount, m_id, pr_id)
values (251, 19, 19);
insert into CONTAINING (c_amount, m_id, pr_id)
values (261, 22, 1);
insert into CONTAINING (c_amount, m_id, pr_id)
values (271, 22, 25);
insert into CONTAINING (c_amount, m_id, pr_id)
values (1, 21, 6);
insert into CONTAINING (c_amount, m_id, pr_id)
values (11, 5, 9);
insert into CONTAINING (c_amount, m_id, pr_id)
values (21, 18, 28);
insert into CONTAINING (c_amount, m_id, pr_id)
values (31, 21, 28);
insert into CONTAINING (c_amount, m_id, pr_id)
values (41, 9, 9);
insert into CONTAINING (c_amount, m_id, pr_id)
values (51, 19, 21);
insert into CONTAINING (c_amount, m_id, pr_id)
values (61, 5, 13);
insert into CONTAINING (c_amount, m_id, pr_id)
values (71, 14, 8);
insert into CONTAINING (c_amount, m_id, pr_id)
values (81, 5, 6);
insert into CONTAINING (c_amount, m_id, pr_id)
values (91, 19, 12);
insert into CONTAINING (c_amount, m_id, pr_id)
values (101, 20, 9);
insert into CONTAINING (c_amount, m_id, pr_id)
values (111, 10, 21);
insert into CONTAINING (c_amount, m_id, pr_id)
values (1, 1, 22);
insert into CONTAINING (c_amount, m_id, pr_id)
values (1, 3, 24);
insert into CONTAINING (c_amount, m_id, pr_id)
values (11, 2, 16);
insert into CONTAINING (c_amount, m_id, pr_id)
values (21, 19, 9);
insert into CONTAINING (c_amount, m_id, pr_id)
values (31, 5, 15);
insert into CONTAINING (c_amount, m_id, pr_id)
values (1, 20, 25);
insert into CONTAINING (c_amount, m_id, pr_id)
values (11, 4, 1);
insert into CONTAINING (c_amount, m_id, pr_id)
values (21, 6, 14);
insert into CONTAINING (c_amount, m_id, pr_id)
values (31, 20, 11);
insert into CONTAINING (c_amount, m_id, pr_id)
values (41, 9, 6);
insert into CONTAINING (c_amount, m_id, pr_id)
values (51, 8, 23);
insert into CONTAINING (c_amount, m_id, pr_id)
values (61, 5, 5);
insert into CONTAINING (c_amount, m_id, pr_id)
values (71, 1, 9);
insert into CONTAINING (c_amount, m_id, pr_id)
values (81, 1, 20);
insert into CONTAINING (c_amount, m_id, pr_id)
values (91, 6, 2);
insert into CONTAINING (c_amount, m_id, pr_id)
values (101, 6, 20);
insert into CONTAINING (c_amount, m_id, pr_id)
values (111, 4, 28);
insert into CONTAINING (c_amount, m_id, pr_id)
values (121, 21, 9);
insert into CONTAINING (c_amount, m_id, pr_id)
values (131, 23, 28);
insert into CONTAINING (c_amount, m_id, pr_id)
values (1, 13, 28);
insert into CONTAINING (c_amount, m_id, pr_id)
values (11, 10, 1);
insert into CONTAINING (c_amount, m_id, pr_id)
values (21, 9, 27);
insert into CONTAINING (c_amount, m_id, pr_id)
values (31, 13, 5);
insert into CONTAINING (c_amount, m_id, pr_id)
values (1, 18, 24);
insert into CONTAINING (c_amount, m_id, pr_id)
values (11, 12, 24);
insert into CONTAINING (c_amount, m_id, pr_id)
values (21, 5, 22);
insert into CONTAINING (c_amount, m_id, pr_id)
values (31, 5, 12);
insert into CONTAINING (c_amount, m_id, pr_id)
values (41, 10, 9);
insert into CONTAINING (c_amount, m_id, pr_id)
values (51, 21, 4);
insert into CONTAINING (c_amount, m_id, pr_id)
values (61, 18, 11);
insert into CONTAINING (c_amount, m_id, pr_id)
values (71, 16, 11);
insert into CONTAINING (c_amount, m_id, pr_id)
values (81, 9, 22);
insert into CONTAINING (c_amount, m_id, pr_id)
values (91, 2, 13);
insert into CONTAINING (c_amount, m_id, pr_id)
values (111, 18, 25);
commit;
prompt 74 records loaded
prompt Loading KITCHENWORKER...
insert into KITCHENWORKER (rank, pk_id)
values ('C', 306);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 307);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 308);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 309);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 310);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 311);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 312);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 313);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 314);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 315);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 316);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 317);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 318);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 319);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 320);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 321);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 322);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 323);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 324);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 325);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 326);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 327);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 328);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 329);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 330);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 331);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 332);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 333);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 334);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 335);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 336);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 337);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 338);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 339);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 340);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 341);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 342);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 343);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 344);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 345);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 346);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 347);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 348);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 349);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 350);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 351);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 352);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 353);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 354);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 355);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 356);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 357);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 358);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 359);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 360);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 361);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 362);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 363);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 364);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 365);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 366);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 367);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 368);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 369);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 370);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 371);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 372);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 373);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 374);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 375);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 376);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 377);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 378);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 379);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 380);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 381);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 382);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 383);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 384);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 385);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 386);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 387);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 388);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 389);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 390);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 391);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 392);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 393);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 394);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 395);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 396);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 397);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 398);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 399);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 400);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 401);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 402);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 403);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 404);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 405);
commit;
prompt 100 records committed...
insert into KITCHENWORKER (rank, pk_id)
values ('C', 406);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 407);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 408);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 409);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 410);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 411);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 412);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 413);
insert into KITCHENWORKER (rank, pk_id)
values ('B', 414);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 415);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 416);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 417);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 418);
insert into KITCHENWORKER (rank, pk_id)
values ('C', 419);
insert into KITCHENWORKER (rank, pk_id)
values ('A', 420);
commit;
prompt 115 records loaded
prompt Loading RESPONSIBLE...
insert into RESPONSIBLE (pk_id, m_id)
values (306, 10);
insert into RESPONSIBLE (pk_id, m_id)
values (306, 22);
insert into RESPONSIBLE (pk_id, m_id)
values (307, 6);
insert into RESPONSIBLE (pk_id, m_id)
values (307, 11);
insert into RESPONSIBLE (pk_id, m_id)
values (307, 12);
insert into RESPONSIBLE (pk_id, m_id)
values (307, 13);
insert into RESPONSIBLE (pk_id, m_id)
values (308, 4);
insert into RESPONSIBLE (pk_id, m_id)
values (310, 21);
insert into RESPONSIBLE (pk_id, m_id)
values (311, 5);
insert into RESPONSIBLE (pk_id, m_id)
values (311, 11);
insert into RESPONSIBLE (pk_id, m_id)
values (311, 19);
insert into RESPONSIBLE (pk_id, m_id)
values (313, 1);
insert into RESPONSIBLE (pk_id, m_id)
values (313, 5);
insert into RESPONSIBLE (pk_id, m_id)
values (313, 19);
insert into RESPONSIBLE (pk_id, m_id)
values (314, 6);
insert into RESPONSIBLE (pk_id, m_id)
values (316, 2);
insert into RESPONSIBLE (pk_id, m_id)
values (316, 12);
insert into RESPONSIBLE (pk_id, m_id)
values (318, 2);
insert into RESPONSIBLE (pk_id, m_id)
values (319, 19);
insert into RESPONSIBLE (pk_id, m_id)
values (320, 20);
insert into RESPONSIBLE (pk_id, m_id)
values (321, 3);
insert into RESPONSIBLE (pk_id, m_id)
values (321, 13);
insert into RESPONSIBLE (pk_id, m_id)
values (323, 5);
insert into RESPONSIBLE (pk_id, m_id)
values (323, 13);
insert into RESPONSIBLE (pk_id, m_id)
values (323, 16);
insert into RESPONSIBLE (pk_id, m_id)
values (323, 19);
insert into RESPONSIBLE (pk_id, m_id)
values (324, 17);
insert into RESPONSIBLE (pk_id, m_id)
values (325, 1);
insert into RESPONSIBLE (pk_id, m_id)
values (326, 6);
insert into RESPONSIBLE (pk_id, m_id)
values (326, 8);
insert into RESPONSIBLE (pk_id, m_id)
values (327, 15);
insert into RESPONSIBLE (pk_id, m_id)
values (328, 4);
insert into RESPONSIBLE (pk_id, m_id)
values (329, 18);
insert into RESPONSIBLE (pk_id, m_id)
values (329, 22);
insert into RESPONSIBLE (pk_id, m_id)
values (330, 14);
insert into RESPONSIBLE (pk_id, m_id)
values (332, 8);
insert into RESPONSIBLE (pk_id, m_id)
values (332, 19);
insert into RESPONSIBLE (pk_id, m_id)
values (333, 19);
insert into RESPONSIBLE (pk_id, m_id)
values (336, 20);
insert into RESPONSIBLE (pk_id, m_id)
values (337, 18);
insert into RESPONSIBLE (pk_id, m_id)
values (338, 1);
insert into RESPONSIBLE (pk_id, m_id)
values (338, 11);
insert into RESPONSIBLE (pk_id, m_id)
values (339, 16);
insert into RESPONSIBLE (pk_id, m_id)
values (340, 12);
insert into RESPONSIBLE (pk_id, m_id)
values (340, 14);
insert into RESPONSIBLE (pk_id, m_id)
values (341, 20);
insert into RESPONSIBLE (pk_id, m_id)
values (341, 21);
insert into RESPONSIBLE (pk_id, m_id)
values (343, 9);
insert into RESPONSIBLE (pk_id, m_id)
values (343, 12);
insert into RESPONSIBLE (pk_id, m_id)
values (345, 2);
insert into RESPONSIBLE (pk_id, m_id)
values (345, 6);
insert into RESPONSIBLE (pk_id, m_id)
values (345, 8);
insert into RESPONSIBLE (pk_id, m_id)
values (346, 6);
insert into RESPONSIBLE (pk_id, m_id)
values (347, 1);
insert into RESPONSIBLE (pk_id, m_id)
values (348, 6);
insert into RESPONSIBLE (pk_id, m_id)
values (348, 11);
insert into RESPONSIBLE (pk_id, m_id)
values (349, 1);
insert into RESPONSIBLE (pk_id, m_id)
values (349, 12);
insert into RESPONSIBLE (pk_id, m_id)
values (351, 4);
insert into RESPONSIBLE (pk_id, m_id)
values (351, 15);
insert into RESPONSIBLE (pk_id, m_id)
values (352, 8);
insert into RESPONSIBLE (pk_id, m_id)
values (353, 5);
insert into RESPONSIBLE (pk_id, m_id)
values (353, 14);
insert into RESPONSIBLE (pk_id, m_id)
values (353, 16);
insert into RESPONSIBLE (pk_id, m_id)
values (353, 21);
insert into RESPONSIBLE (pk_id, m_id)
values (355, 3);
insert into RESPONSIBLE (pk_id, m_id)
values (355, 18);
insert into RESPONSIBLE (pk_id, m_id)
values (356, 1);
insert into RESPONSIBLE (pk_id, m_id)
values (358, 6);
insert into RESPONSIBLE (pk_id, m_id)
values (358, 9);
insert into RESPONSIBLE (pk_id, m_id)
values (360, 4);
insert into RESPONSIBLE (pk_id, m_id)
values (360, 19);
insert into RESPONSIBLE (pk_id, m_id)
values (362, 7);
insert into RESPONSIBLE (pk_id, m_id)
values (362, 11);
insert into RESPONSIBLE (pk_id, m_id)
values (362, 12);
insert into RESPONSIBLE (pk_id, m_id)
values (362, 15);
insert into RESPONSIBLE (pk_id, m_id)
values (363, 4);
insert into RESPONSIBLE (pk_id, m_id)
values (364, 5);
insert into RESPONSIBLE (pk_id, m_id)
values (364, 17);
insert into RESPONSIBLE (pk_id, m_id)
values (365, 7);
insert into RESPONSIBLE (pk_id, m_id)
values (365, 15);
insert into RESPONSIBLE (pk_id, m_id)
values (366, 3);
insert into RESPONSIBLE (pk_id, m_id)
values (368, 6);
insert into RESPONSIBLE (pk_id, m_id)
values (368, 15);
insert into RESPONSIBLE (pk_id, m_id)
values (369, 7);
insert into RESPONSIBLE (pk_id, m_id)
values (370, 14);
insert into RESPONSIBLE (pk_id, m_id)
values (371, 1);
insert into RESPONSIBLE (pk_id, m_id)
values (371, 23);
insert into RESPONSIBLE (pk_id, m_id)
values (372, 6);
insert into RESPONSIBLE (pk_id, m_id)
values (374, 2);
insert into RESPONSIBLE (pk_id, m_id)
values (374, 5);
insert into RESPONSIBLE (pk_id, m_id)
values (374, 15);
insert into RESPONSIBLE (pk_id, m_id)
values (375, 21);
insert into RESPONSIBLE (pk_id, m_id)
values (376, 8);
insert into RESPONSIBLE (pk_id, m_id)
values (376, 12);
insert into RESPONSIBLE (pk_id, m_id)
values (376, 16);
insert into RESPONSIBLE (pk_id, m_id)
values (377, 5);
insert into RESPONSIBLE (pk_id, m_id)
values (380, 8);
insert into RESPONSIBLE (pk_id, m_id)
values (380, 11);
insert into RESPONSIBLE (pk_id, m_id)
values (380, 19);
commit;
prompt 100 records committed...
insert into RESPONSIBLE (pk_id, m_id)
values (380, 23);
insert into RESPONSIBLE (pk_id, m_id)
values (381, 4);
insert into RESPONSIBLE (pk_id, m_id)
values (381, 7);
insert into RESPONSIBLE (pk_id, m_id)
values (382, 7);
insert into RESPONSIBLE (pk_id, m_id)
values (383, 2);
insert into RESPONSIBLE (pk_id, m_id)
values (383, 8);
insert into RESPONSIBLE (pk_id, m_id)
values (383, 21);
insert into RESPONSIBLE (pk_id, m_id)
values (383, 23);
insert into RESPONSIBLE (pk_id, m_id)
values (384, 14);
insert into RESPONSIBLE (pk_id, m_id)
values (385, 15);
insert into RESPONSIBLE (pk_id, m_id)
values (386, 4);
insert into RESPONSIBLE (pk_id, m_id)
values (386, 12);
insert into RESPONSIBLE (pk_id, m_id)
values (387, 5);
insert into RESPONSIBLE (pk_id, m_id)
values (387, 9);
insert into RESPONSIBLE (pk_id, m_id)
values (388, 23);
insert into RESPONSIBLE (pk_id, m_id)
values (391, 12);
insert into RESPONSIBLE (pk_id, m_id)
values (393, 5);
insert into RESPONSIBLE (pk_id, m_id)
values (394, 14);
insert into RESPONSIBLE (pk_id, m_id)
values (395, 12);
insert into RESPONSIBLE (pk_id, m_id)
values (396, 13);
insert into RESPONSIBLE (pk_id, m_id)
values (396, 20);
insert into RESPONSIBLE (pk_id, m_id)
values (397, 23);
insert into RESPONSIBLE (pk_id, m_id)
values (400, 15);
insert into RESPONSIBLE (pk_id, m_id)
values (402, 1);
insert into RESPONSIBLE (pk_id, m_id)
values (402, 12);
insert into RESPONSIBLE (pk_id, m_id)
values (403, 5);
insert into RESPONSIBLE (pk_id, m_id)
values (405, 6);
insert into RESPONSIBLE (pk_id, m_id)
values (406, 4);
insert into RESPONSIBLE (pk_id, m_id)
values (406, 13);
insert into RESPONSIBLE (pk_id, m_id)
values (406, 21);
insert into RESPONSIBLE (pk_id, m_id)
values (408, 17);
insert into RESPONSIBLE (pk_id, m_id)
values (409, 1);
insert into RESPONSIBLE (pk_id, m_id)
values (409, 8);
insert into RESPONSIBLE (pk_id, m_id)
values (409, 12);
insert into RESPONSIBLE (pk_id, m_id)
values (410, 7);
insert into RESPONSIBLE (pk_id, m_id)
values (412, 9);
insert into RESPONSIBLE (pk_id, m_id)
values (413, 1);
insert into RESPONSIBLE (pk_id, m_id)
values (413, 11);
insert into RESPONSIBLE (pk_id, m_id)
values (414, 4);
insert into RESPONSIBLE (pk_id, m_id)
values (414, 12);
insert into RESPONSIBLE (pk_id, m_id)
values (414, 19);
insert into RESPONSIBLE (pk_id, m_id)
values (415, 16);
insert into RESPONSIBLE (pk_id, m_id)
values (416, 3);
insert into RESPONSIBLE (pk_id, m_id)
values (416, 11);
insert into RESPONSIBLE (pk_id, m_id)
values (416, 13);
insert into RESPONSIBLE (pk_id, m_id)
values (416, 17);
insert into RESPONSIBLE (pk_id, m_id)
values (419, 6);
insert into RESPONSIBLE (pk_id, m_id)
values (419, 9);
insert into RESPONSIBLE (pk_id, m_id)
values (419, 10);
insert into RESPONSIBLE (pk_id, m_id)
values (419, 23);
insert into RESPONSIBLE (pk_id, m_id)
values (420, 12);
commit;
prompt 151 records loaded
prompt Loading SUPPLIER...
insert into SUPPLIER (s_id, s_name)
values (1, ' Kedma');
insert into SUPPLIER (s_id, s_name)
values (2, ' osem');
insert into SUPPLIER (s_id, s_name)
values (3, ' Berman');
insert into SUPPLIER (s_id, s_name)
values (4, 'Lucinda');
insert into SUPPLIER (s_id, s_name)
values (5, 'Patricia');
insert into SUPPLIER (s_id, s_name)
values (6, 'Hookah');
insert into SUPPLIER (s_id, s_name)
values (7, 'Kazem');
insert into SUPPLIER (s_id, s_name)
values (8, 'Joely');
insert into SUPPLIER (s_id, s_name)
values (9, 'Garland');
insert into SUPPLIER (s_id, s_name)
values (10, 'Liev');
insert into SUPPLIER (s_id, s_name)
values (11, 'Armand');
insert into SUPPLIER (s_id, s_name)
values (12, 'Suzy');
insert into SUPPLIER (s_id, s_name)
values (13, 'Natacha');
insert into SUPPLIER (s_id, s_name)
values (14, 'Helen');
insert into SUPPLIER (s_id, s_name)
values (15, 'Wang');
insert into SUPPLIER (s_id, s_name)
values (16, 'Frank');
insert into SUPPLIER (s_id, s_name)
values (17, 'Lonnie');
insert into SUPPLIER (s_id, s_name)
values (18, 'Matthew');
insert into SUPPLIER (s_id, s_name)
values (19, 'Danny');
insert into SUPPLIER (s_id, s_name)
values (20, 'Andre');
insert into SUPPLIER (s_id, s_name)
values (21, 'Brothers');
insert into SUPPLIER (s_id, s_name)
values (22, 'Rene');
insert into SUPPLIER (s_id, s_name)
values (23, 'Queen');
insert into SUPPLIER (s_id, s_name)
values (24, 'Arturo');
insert into SUPPLIER (s_id, s_name)
values (25, 'Heath');
insert into SUPPLIER (s_id, s_name)
values (26, 'Annette');
insert into SUPPLIER (s_id, s_name)
values (27, 'Gary');
insert into SUPPLIER (s_id, s_name)
values (28, 'Arnold');
insert into SUPPLIER (s_id, s_name)
values (29, 'Loretta');
insert into SUPPLIER (s_id, s_name)
values (30, 'Debi');
insert into SUPPLIER (s_id, s_name)
values (31, 'Ceili');
insert into SUPPLIER (s_id, s_name)
values (32, 'Tara');
insert into SUPPLIER (s_id, s_name)
values (33, 'Lenny');
insert into SUPPLIER (s_id, s_name)
values (34, 'Gena');
insert into SUPPLIER (s_id, s_name)
values (35, 'Jarvis');
insert into SUPPLIER (s_id, s_name)
values (36, 'Debby');
insert into SUPPLIER (s_id, s_name)
values (37, 'Frankie');
insert into SUPPLIER (s_id, s_name)
values (38, 'Anjelica');
insert into SUPPLIER (s_id, s_name)
values (39, 'Anne');
insert into SUPPLIER (s_id, s_name)
values (40, 'Lynette');
insert into SUPPLIER (s_id, s_name)
values (41, 'Dorry');
insert into SUPPLIER (s_id, s_name)
values (42, 'Ernie');
insert into SUPPLIER (s_id, s_name)
values (43, 'Alessandro');
insert into SUPPLIER (s_id, s_name)
values (44, 'Lindsay');
insert into SUPPLIER (s_id, s_name)
values (45, 'Terry');
insert into SUPPLIER (s_id, s_name)
values (46, 'Nicolas');
insert into SUPPLIER (s_id, s_name)
values (47, 'Billy');
insert into SUPPLIER (s_id, s_name)
values (48, 'Kurtwood');
insert into SUPPLIER (s_id, s_name)
values (49, 'Jessica');
insert into SUPPLIER (s_id, s_name)
values (50, 'Natascha');
insert into SUPPLIER (s_id, s_name)
values (51, 'Kirsten');
insert into SUPPLIER (s_id, s_name)
values (52, 'Avenged');
insert into SUPPLIER (s_id, s_name)
values (53, 'Daryl');
insert into SUPPLIER (s_id, s_name)
values (54, 'Edie');
insert into SUPPLIER (s_id, s_name)
values (55, 'Sarah');
insert into SUPPLIER (s_id, s_name)
values (56, 'Jean-Claude');
insert into SUPPLIER (s_id, s_name)
values (57, 'Emmylou');
insert into SUPPLIER (s_id, s_name)
values (58, 'Andrea');
insert into SUPPLIER (s_id, s_name)
values (59, 'Armand');
insert into SUPPLIER (s_id, s_name)
values (60, 'Edwin');
insert into SUPPLIER (s_id, s_name)
values (61, 'Melba');
insert into SUPPLIER (s_id, s_name)
values (62, 'Susan');
insert into SUPPLIER (s_id, s_name)
values (63, 'Madeline');
insert into SUPPLIER (s_id, s_name)
values (64, 'Lindsey');
insert into SUPPLIER (s_id, s_name)
values (65, 'Elijah');
insert into SUPPLIER (s_id, s_name)
values (66, 'Gerald');
insert into SUPPLIER (s_id, s_name)
values (67, 'Howard');
insert into SUPPLIER (s_id, s_name)
values (68, 'Merrilee');
insert into SUPPLIER (s_id, s_name)
values (69, 'Meryl');
insert into SUPPLIER (s_id, s_name)
values (70, 'Joey');
insert into SUPPLIER (s_id, s_name)
values (71, 'Curtis');
insert into SUPPLIER (s_id, s_name)
values (72, 'Loren');
insert into SUPPLIER (s_id, s_name)
values (73, 'David');
insert into SUPPLIER (s_id, s_name)
values (74, 'Andrew');
insert into SUPPLIER (s_id, s_name)
values (75, 'Jessica');
insert into SUPPLIER (s_id, s_name)
values (76, 'Harris');
insert into SUPPLIER (s_id, s_name)
values (77, 'Reese');
insert into SUPPLIER (s_id, s_name)
values (78, 'Debby');
insert into SUPPLIER (s_id, s_name)
values (79, 'Harry');
insert into SUPPLIER (s_id, s_name)
values (80, 'Robby');
insert into SUPPLIER (s_id, s_name)
values (81, 'Ann');
insert into SUPPLIER (s_id, s_name)
values (82, 'Steve');
insert into SUPPLIER (s_id, s_name)
values (83, 'Sam');
insert into SUPPLIER (s_id, s_name)
values (84, 'Nikka');
insert into SUPPLIER (s_id, s_name)
values (85, 'Meg');
insert into SUPPLIER (s_id, s_name)
values (86, 'Juice');
insert into SUPPLIER (s_id, s_name)
values (87, 'Geoff');
insert into SUPPLIER (s_id, s_name)
values (88, 'Dabney');
insert into SUPPLIER (s_id, s_name)
values (89, 'Harvey');
insert into SUPPLIER (s_id, s_name)
values (90, 'Adam');
insert into SUPPLIER (s_id, s_name)
values (91, 'Warren');
insert into SUPPLIER (s_id, s_name)
values (92, 'Wally');
insert into SUPPLIER (s_id, s_name)
values (93, 'Mary Beth');
insert into SUPPLIER (s_id, s_name)
values (94, 'Jerry');
insert into SUPPLIER (s_id, s_name)
values (95, 'Maxine');
insert into SUPPLIER (s_id, s_name)
values (96, 'Sandra');
insert into SUPPLIER (s_id, s_name)
values (97, 'Vickie');
insert into SUPPLIER (s_id, s_name)
values (98, 'Sona');
insert into SUPPLIER (s_id, s_name)
values (99, 'Famke');
insert into SUPPLIER (s_id, s_name)
values (100, 'April');
commit;
prompt 100 records committed...
insert into SUPPLIER (s_id, s_name)
values (101, 'Larenz');
insert into SUPPLIER (s_id, s_name)
values (102, 'Vonda');
insert into SUPPLIER (s_id, s_name)
values (103, 'Isaiah');
insert into SUPPLIER (s_id, s_name)
values (104, 'Wendy');
insert into SUPPLIER (s_id, s_name)
values (105, 'Spencer');
insert into SUPPLIER (s_id, s_name)
values (106, 'Kyle');
insert into SUPPLIER (s_id, s_name)
values (107, 'Suzy');
insert into SUPPLIER (s_id, s_name)
values (108, 'Jimmy');
insert into SUPPLIER (s_id, s_name)
values (109, 'Thin');
insert into SUPPLIER (s_id, s_name)
values (110, 'Lesley');
insert into SUPPLIER (s_id, s_name)
values (111, 'Sophie');
insert into SUPPLIER (s_id, s_name)
values (112, 'Lydia');
insert into SUPPLIER (s_id, s_name)
values (113, 'Lupe');
insert into SUPPLIER (s_id, s_name)
values (114, 'Nicolas');
insert into SUPPLIER (s_id, s_name)
values (115, 'Juan');
insert into SUPPLIER (s_id, s_name)
values (116, 'Warren');
insert into SUPPLIER (s_id, s_name)
values (117, 'Elijah');
insert into SUPPLIER (s_id, s_name)
values (118, 'Elias');
insert into SUPPLIER (s_id, s_name)
values (119, 'Coley');
insert into SUPPLIER (s_id, s_name)
values (120, 'Marlon');
insert into SUPPLIER (s_id, s_name)
values (121, 'Rip');
insert into SUPPLIER (s_id, s_name)
values (122, 'Barry');
insert into SUPPLIER (s_id, s_name)
values (123, 'Lizzy');
insert into SUPPLIER (s_id, s_name)
values (124, 'Taye');
insert into SUPPLIER (s_id, s_name)
values (125, 'Anna');
insert into SUPPLIER (s_id, s_name)
values (126, 'Rachel');
insert into SUPPLIER (s_id, s_name)
values (127, 'Larenz');
insert into SUPPLIER (s_id, s_name)
values (128, 'Mia');
insert into SUPPLIER (s_id, s_name)
values (129, 'Beth');
insert into SUPPLIER (s_id, s_name)
values (130, 'Lily');
insert into SUPPLIER (s_id, s_name)
values (131, 'Burton');
insert into SUPPLIER (s_id, s_name)
values (132, 'Phoebe');
insert into SUPPLIER (s_id, s_name)
values (133, 'Jonny Lee');
insert into SUPPLIER (s_id, s_name)
values (134, 'Hope');
insert into SUPPLIER (s_id, s_name)
values (135, 'Nathan');
insert into SUPPLIER (s_id, s_name)
values (136, 'Diamond');
insert into SUPPLIER (s_id, s_name)
values (137, 'Hank');
insert into SUPPLIER (s_id, s_name)
values (138, 'Rick');
insert into SUPPLIER (s_id, s_name)
values (139, 'Donal');
insert into SUPPLIER (s_id, s_name)
values (140, 'Malcolm');
insert into SUPPLIER (s_id, s_name)
values (141, 'Curt');
insert into SUPPLIER (s_id, s_name)
values (142, 'Gwyneth');
insert into SUPPLIER (s_id, s_name)
values (143, 'Naomi');
insert into SUPPLIER (s_id, s_name)
values (144, 'Radney');
insert into SUPPLIER (s_id, s_name)
values (145, 'Emilio');
insert into SUPPLIER (s_id, s_name)
values (146, 'Ian');
insert into SUPPLIER (s_id, s_name)
values (147, 'Louise');
insert into SUPPLIER (s_id, s_name)
values (148, 'Albertina');
insert into SUPPLIER (s_id, s_name)
values (149, 'Night');
insert into SUPPLIER (s_id, s_name)
values (150, 'Tyrone');
insert into SUPPLIER (s_id, s_name)
values (151, 'Val');
insert into SUPPLIER (s_id, s_name)
values (152, 'Russell');
insert into SUPPLIER (s_id, s_name)
values (153, 'Chloe');
insert into SUPPLIER (s_id, s_name)
values (154, 'Mark');
insert into SUPPLIER (s_id, s_name)
values (155, 'Merrill');
insert into SUPPLIER (s_id, s_name)
values (156, 'Jason');
insert into SUPPLIER (s_id, s_name)
values (157, 'Mac');
insert into SUPPLIER (s_id, s_name)
values (158, 'Phil');
insert into SUPPLIER (s_id, s_name)
values (159, 'Nickel');
insert into SUPPLIER (s_id, s_name)
values (160, 'Emilio');
insert into SUPPLIER (s_id, s_name)
values (161, 'Alfred');
insert into SUPPLIER (s_id, s_name)
values (162, 'Robert');
insert into SUPPLIER (s_id, s_name)
values (163, 'Mindy');
insert into SUPPLIER (s_id, s_name)
values (164, 'Debi');
insert into SUPPLIER (s_id, s_name)
values (165, 'Meredith');
insert into SUPPLIER (s_id, s_name)
values (166, 'Bernard');
insert into SUPPLIER (s_id, s_name)
values (167, 'Mel');
insert into SUPPLIER (s_id, s_name)
values (168, 'Nicholas');
insert into SUPPLIER (s_id, s_name)
values (169, 'Edward');
insert into SUPPLIER (s_id, s_name)
values (170, 'Billy');
insert into SUPPLIER (s_id, s_name)
values (171, 'Oliver');
insert into SUPPLIER (s_id, s_name)
values (172, 'Elle');
insert into SUPPLIER (s_id, s_name)
values (173, 'Millie');
insert into SUPPLIER (s_id, s_name)
values (174, 'Fionnula');
insert into SUPPLIER (s_id, s_name)
values (175, 'Wally');
insert into SUPPLIER (s_id, s_name)
values (176, 'Leslie');
insert into SUPPLIER (s_id, s_name)
values (177, 'Demi');
insert into SUPPLIER (s_id, s_name)
values (178, 'Aaron');
insert into SUPPLIER (s_id, s_name)
values (179, 'Cheryl');
insert into SUPPLIER (s_id, s_name)
values (180, 'Brent');
insert into SUPPLIER (s_id, s_name)
values (181, 'Diane');
insert into SUPPLIER (s_id, s_name)
values (182, 'Harry');
insert into SUPPLIER (s_id, s_name)
values (183, 'Ray');
insert into SUPPLIER (s_id, s_name)
values (184, 'Sophie');
insert into SUPPLIER (s_id, s_name)
values (185, 'Kay');
insert into SUPPLIER (s_id, s_name)
values (186, 'France');
insert into SUPPLIER (s_id, s_name)
values (187, 'Freda');
insert into SUPPLIER (s_id, s_name)
values (188, 'Larnelle');
insert into SUPPLIER (s_id, s_name)
values (189, 'Cyndi');
insert into SUPPLIER (s_id, s_name)
values (190, 'Geena');
insert into SUPPLIER (s_id, s_name)
values (191, 'Lou');
insert into SUPPLIER (s_id, s_name)
values (192, 'Jeffery');
insert into SUPPLIER (s_id, s_name)
values (193, 'Charlie');
insert into SUPPLIER (s_id, s_name)
values (194, 'Paula');
insert into SUPPLIER (s_id, s_name)
values (195, 'Madeleine');
insert into SUPPLIER (s_id, s_name)
values (196, 'Ashton');
insert into SUPPLIER (s_id, s_name)
values (197, 'Trini');
insert into SUPPLIER (s_id, s_name)
values (198, 'Sigourney');
insert into SUPPLIER (s_id, s_name)
values (199, 'Jane');
insert into SUPPLIER (s_id, s_name)
values (200, 'Lucy');
commit;
prompt 200 records committed...
insert into SUPPLIER (s_id, s_name)
values (201, 'Maceo');
insert into SUPPLIER (s_id, s_name)
values (202, 'Tim');
insert into SUPPLIER (s_id, s_name)
values (203, 'Sara');
commit;
prompt 203 records loaded
prompt Loading SUPPLY...
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (19, to_date('14-09-2022', 'dd-mm-yyyy'), 56, 27);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (19, to_date('18-11-2022', 'dd-mm-yyyy'), 69, 17);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (12, to_date('23-01-2022', 'dd-mm-yyyy'), 99, 8);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (10, to_date('27-11-2022', 'dd-mm-yyyy'), 82, 20);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (14, to_date('12-04-2022', 'dd-mm-yyyy'), 54, 17);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (20, to_date('10-11-2024', 'dd-mm-yyyy'), 116, 18);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (4, to_date('30-06-2024', 'dd-mm-yyyy'), 155, 8);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (20, to_date('18-09-2023', 'dd-mm-yyyy'), 83, 25);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (6, to_date('21-05-2024', 'dd-mm-yyyy'), 75, 6);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (3, to_date('03-05-2022', 'dd-mm-yyyy'), 92, 27);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (6, to_date('18-05-2024', 'dd-mm-yyyy'), 110, 22);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (15, to_date('29-01-2023', 'dd-mm-yyyy'), 38, 1);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (14, to_date('21-03-2024', 'dd-mm-yyyy'), 18, 5);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (16, to_date('15-10-2024', 'dd-mm-yyyy'), 15, 12);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (2, to_date('11-12-2022', 'dd-mm-yyyy'), 88, 18);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (2, to_date('09-04-2022', 'dd-mm-yyyy'), 132, 20);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (11, to_date('25-04-2023', 'dd-mm-yyyy'), 5, 21);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (6, to_date('05-03-2023', 'dd-mm-yyyy'), 135, 20);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (2, to_date('01-09-2023', 'dd-mm-yyyy'), 155, 7);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (18, to_date('27-04-2022', 'dd-mm-yyyy'), 63, 14);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (11, to_date('23-03-2024', 'dd-mm-yyyy'), 100, 20);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (14, to_date('26-06-2023', 'dd-mm-yyyy'), 102, 20);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (5, to_date('28-10-2023', 'dd-mm-yyyy'), 113, 10);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (16, to_date('30-07-2024', 'dd-mm-yyyy'), 44, 15);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (13, to_date('03-02-2022', 'dd-mm-yyyy'), 88, 2);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (2, to_date('25-04-2023', 'dd-mm-yyyy'), 179, 11);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (11, to_date('23-01-2024', 'dd-mm-yyyy'), 86, 23);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (12, to_date('09-04-2022', 'dd-mm-yyyy'), 178, 13);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (12, to_date('18-03-2023', 'dd-mm-yyyy'), 78, 17);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (19, to_date('02-06-2024', 'dd-mm-yyyy'), 5, 8);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (11, to_date('14-12-2022', 'dd-mm-yyyy'), 110, 7);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (18, to_date('28-01-2022', 'dd-mm-yyyy'), 44, 22);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (4, to_date('27-07-2024', 'dd-mm-yyyy'), 77, 24);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (16, to_date('15-04-2024', 'dd-mm-yyyy'), 7, 13);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (12, to_date('24-07-2023', 'dd-mm-yyyy'), 113, 17);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (8, to_date('04-09-2023', 'dd-mm-yyyy'), 102, 25);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (20, to_date('13-06-2023', 'dd-mm-yyyy'), 187, 15);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (9, to_date('08-09-2022', 'dd-mm-yyyy'), 168, 25);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (7, to_date('02-01-2022', 'dd-mm-yyyy'), 113, 1);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (8, to_date('26-04-2023', 'dd-mm-yyyy'), 56, 13);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (10, to_date('13-12-2023', 'dd-mm-yyyy'), 184, 9);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (9, to_date('27-03-2022', 'dd-mm-yyyy'), 13, 13);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (8, to_date('09-01-2023', 'dd-mm-yyyy'), 197, 13);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (3, to_date('20-05-2023', 'dd-mm-yyyy'), 64, 10);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (15, to_date('29-07-2022', 'dd-mm-yyyy'), 111, 15);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (14, to_date('21-12-2022', 'dd-mm-yyyy'), 21, 12);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (8, to_date('10-07-2022', 'dd-mm-yyyy'), 109, 9);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (9, to_date('15-12-2023', 'dd-mm-yyyy'), 109, 5);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (16, to_date('16-10-2023', 'dd-mm-yyyy'), 67, 25);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (12, to_date('27-11-2022', 'dd-mm-yyyy'), 188, 4);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (15, to_date('28-02-2023', 'dd-mm-yyyy'), 46, 4);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (17, to_date('13-05-2023', 'dd-mm-yyyy'), 197, 28);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (19, to_date('01-08-2022', 'dd-mm-yyyy'), 192, 1);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (17, to_date('02-08-2024', 'dd-mm-yyyy'), 14, 22);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (17, to_date('24-11-2022', 'dd-mm-yyyy'), 37, 12);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (7, to_date('05-10-2024', 'dd-mm-yyyy'), 133, 1);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (6, to_date('08-01-2023', 'dd-mm-yyyy'), 46, 9);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (11, to_date('29-08-2023', 'dd-mm-yyyy'), 120, 5);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (13, to_date('21-07-2024', 'dd-mm-yyyy'), 134, 5);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (12, to_date('08-09-2024', 'dd-mm-yyyy'), 127, 11);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (6, to_date('29-10-2023', 'dd-mm-yyyy'), 18, 17);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (17, to_date('09-06-2024', 'dd-mm-yyyy'), 195, 3);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (2, to_date('20-05-2024', 'dd-mm-yyyy'), 195, 17);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (10, to_date('14-08-2022', 'dd-mm-yyyy'), 163, 21);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (20, to_date('03-12-2024', 'dd-mm-yyyy'), 92, 20);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (4, to_date('17-06-2022', 'dd-mm-yyyy'), 9, 10);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (11, to_date('19-08-2024', 'dd-mm-yyyy'), 76, 25);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (11, to_date('16-07-2024', 'dd-mm-yyyy'), 196, 27);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (12, to_date('05-01-2022', 'dd-mm-yyyy'), 41, 10);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (20, to_date('19-01-2023', 'dd-mm-yyyy'), 4, 10);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (3, to_date('05-02-2022', 'dd-mm-yyyy'), 22, 24);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (8, to_date('05-07-2022', 'dd-mm-yyyy'), 135, 19);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (18, to_date('19-02-2022', 'dd-mm-yyyy'), 22, 15);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (20, to_date('21-11-2023', 'dd-mm-yyyy'), 61, 18);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (6, to_date('11-09-2023', 'dd-mm-yyyy'), 47, 16);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (11, to_date('22-03-2023', 'dd-mm-yyyy'), 158, 16);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (11, to_date('23-07-2024', 'dd-mm-yyyy'), 102, 22);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (4, to_date('06-01-2023', 'dd-mm-yyyy'), 125, 3);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (17, to_date('12-07-2022', 'dd-mm-yyyy'), 91, 20);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (15, to_date('30-08-2023', 'dd-mm-yyyy'), 117, 14);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (4, to_date('17-02-2024', 'dd-mm-yyyy'), 75, 28);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (3, to_date('22-11-2024', 'dd-mm-yyyy'), 175, 6);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (18, to_date('06-02-2022', 'dd-mm-yyyy'), 201, 8);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (11, to_date('16-11-2022', 'dd-mm-yyyy'), 117, 28);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (3, to_date('13-09-2024', 'dd-mm-yyyy'), 141, 19);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (1, to_date('18-12-2024', 'dd-mm-yyyy'), 51, 28);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (13, to_date('20-11-2022', 'dd-mm-yyyy'), 176, 10);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (6, to_date('11-11-2024', 'dd-mm-yyyy'), 101, 21);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (11, to_date('24-12-2022', 'dd-mm-yyyy'), 59, 12);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (15, to_date('28-03-2022', 'dd-mm-yyyy'), 135, 17);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (10, to_date('22-09-2024', 'dd-mm-yyyy'), 124, 15);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (2, to_date('09-10-2023', 'dd-mm-yyyy'), 127, 15);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (3, to_date('30-10-2022', 'dd-mm-yyyy'), 180, 10);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (13, to_date('22-08-2022', 'dd-mm-yyyy'), 110, 1);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (15, to_date('24-11-2022', 'dd-mm-yyyy'), 32, 16);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (3, to_date('16-06-2022', 'dd-mm-yyyy'), 158, 18);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (11, to_date('05-11-2023', 'dd-mm-yyyy'), 23, 3);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (1, to_date('08-08-2024', 'dd-mm-yyyy'), 163, 15);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (14, to_date('13-09-2023', 'dd-mm-yyyy'), 161, 21);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (8, to_date('20-01-2024', 'dd-mm-yyyy'), 43, 17);
commit;
prompt 100 records committed...
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (14, to_date('25-11-2024', 'dd-mm-yyyy'), 79, 7);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (11, to_date('06-08-2022', 'dd-mm-yyyy'), 160, 17);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (5, to_date('27-12-2023', 'dd-mm-yyyy'), 15, 1);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (16, to_date('10-07-2023', 'dd-mm-yyyy'), 120, 27);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (6, to_date('26-09-2024', 'dd-mm-yyyy'), 183, 5);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (10, to_date('20-09-2022', 'dd-mm-yyyy'), 40, 13);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (8, to_date('04-10-2023', 'dd-mm-yyyy'), 159, 5);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (16, to_date('26-03-2023', 'dd-mm-yyyy'), 182, 22);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (7, to_date('29-06-2022', 'dd-mm-yyyy'), 106, 22);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (11, to_date('29-03-2022', 'dd-mm-yyyy'), 8, 24);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (10, to_date('09-09-2023', 'dd-mm-yyyy'), 177, 25);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (13, to_date('01-07-2024', 'dd-mm-yyyy'), 78, 20);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (9, to_date('14-04-2024', 'dd-mm-yyyy'), 150, 28);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (18, to_date('06-03-2022', 'dd-mm-yyyy'), 111, 21);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (16, to_date('25-09-2022', 'dd-mm-yyyy'), 75, 11);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (5, to_date('05-03-2022', 'dd-mm-yyyy'), 102, 5);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (8, to_date('10-10-2022', 'dd-mm-yyyy'), 126, 17);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (18, to_date('05-11-2024', 'dd-mm-yyyy'), 27, 23);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (17, to_date('24-08-2024', 'dd-mm-yyyy'), 69, 28);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (20, to_date('09-03-2023', 'dd-mm-yyyy'), 173, 11);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (10, to_date('20-09-2024', 'dd-mm-yyyy'), 148, 25);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (8, to_date('06-06-2022', 'dd-mm-yyyy'), 63, 15);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (20, to_date('30-07-2023', 'dd-mm-yyyy'), 168, 23);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (15, to_date('10-02-2023', 'dd-mm-yyyy'), 23, 28);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (18, to_date('16-07-2024', 'dd-mm-yyyy'), 11, 10);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (5, to_date('17-07-2024', 'dd-mm-yyyy'), 132, 10);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (16, to_date('12-08-2022', 'dd-mm-yyyy'), 157, 19);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (19, to_date('27-09-2024', 'dd-mm-yyyy'), 197, 18);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (7, to_date('19-11-2022', 'dd-mm-yyyy'), 198, 9);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (13, to_date('14-10-2022', 'dd-mm-yyyy'), 144, 23);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (9, to_date('08-05-2022', 'dd-mm-yyyy'), 197, 11);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (4, to_date('18-08-2023', 'dd-mm-yyyy'), 16, 24);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (7, to_date('08-03-2024', 'dd-mm-yyyy'), 37, 20);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (13, to_date('26-04-2024', 'dd-mm-yyyy'), 194, 2);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (2, to_date('13-06-2024', 'dd-mm-yyyy'), 200, 24);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (12, to_date('04-09-2023', 'dd-mm-yyyy'), 198, 17);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (14, to_date('25-03-2022', 'dd-mm-yyyy'), 124, 21);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (11, to_date('31-05-2022', 'dd-mm-yyyy'), 149, 14);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (12, to_date('20-03-2023', 'dd-mm-yyyy'), 23, 15);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (6, to_date('03-09-2022', 'dd-mm-yyyy'), 6, 24);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (20, to_date('19-09-2024', 'dd-mm-yyyy'), 80, 16);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (9, to_date('09-01-2024', 'dd-mm-yyyy'), 35, 13);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (11, to_date('18-02-2024', 'dd-mm-yyyy'), 61, 3);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (18, to_date('14-11-2024', 'dd-mm-yyyy'), 75, 16);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (17, to_date('27-10-2023', 'dd-mm-yyyy'), 159, 24);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (10, to_date('05-05-2023', 'dd-mm-yyyy'), 29, 4);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (2, to_date('14-06-2023', 'dd-mm-yyyy'), 19, 8);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (15, to_date('20-07-2023', 'dd-mm-yyyy'), 171, 6);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (14, to_date('02-10-2023', 'dd-mm-yyyy'), 19, 20);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (10, to_date('13-05-2023', 'dd-mm-yyyy'), 38, 24);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (3, to_date('27-09-2023', 'dd-mm-yyyy'), 115, 12);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (13, to_date('25-07-2022', 'dd-mm-yyyy'), 187, 9);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (15, to_date('29-04-2023', 'dd-mm-yyyy'), 131, 8);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (5, to_date('15-06-2024', 'dd-mm-yyyy'), 93, 7);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (16, to_date('10-06-2022', 'dd-mm-yyyy'), 54, 8);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (2, to_date('03-12-2024', 'dd-mm-yyyy'), 135, 15);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (19, to_date('08-07-2022', 'dd-mm-yyyy'), 141, 7);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (20, to_date('28-11-2024', 'dd-mm-yyyy'), 133, 12);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (18, to_date('16-06-2024', 'dd-mm-yyyy'), 28, 16);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (13, to_date('05-05-2024', 'dd-mm-yyyy'), 133, 24);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (20, to_date('10-01-2023', 'dd-mm-yyyy'), 77, 21);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (18, to_date('03-07-2024', 'dd-mm-yyyy'), 195, 4);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (10, to_date('06-09-2024', 'dd-mm-yyyy'), 100, 21);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (14, to_date('26-10-2023', 'dd-mm-yyyy'), 187, 22);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (19, to_date('05-11-2022', 'dd-mm-yyyy'), 129, 2);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (10, to_date('31-01-2022', 'dd-mm-yyyy'), 201, 4);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (3, to_date('04-08-2023', 'dd-mm-yyyy'), 182, 21);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (10, to_date('02-03-2024', 'dd-mm-yyyy'), 178, 17);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (14, to_date('24-10-2022', 'dd-mm-yyyy'), 35, 4);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (1, to_date('05-02-2022', 'dd-mm-yyyy'), 144, 27);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (8, to_date('12-10-2024', 'dd-mm-yyyy'), 32, 14);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (19, to_date('14-08-2024', 'dd-mm-yyyy'), 58, 8);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (8, to_date('07-03-2024', 'dd-mm-yyyy'), 74, 10);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (1, to_date('11-06-2022', 'dd-mm-yyyy'), 165, 14);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (19, to_date('30-04-2023', 'dd-mm-yyyy'), 124, 14);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (14, to_date('02-02-2023', 'dd-mm-yyyy'), 20, 17);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (16, to_date('01-12-2023', 'dd-mm-yyyy'), 139, 10);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (5, to_date('25-09-2023', 'dd-mm-yyyy'), 167, 9);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (6, to_date('14-07-2023', 'dd-mm-yyyy'), 109, 3);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (14, to_date('13-08-2023', 'dd-mm-yyyy'), 111, 9);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (13, to_date('24-09-2023', 'dd-mm-yyyy'), 201, 4);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (8, to_date('03-01-2023', 'dd-mm-yyyy'), 149, 5);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (2, to_date('30-03-2022', 'dd-mm-yyyy'), 121, 21);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (8, to_date('02-11-2022', 'dd-mm-yyyy'), 7, 16);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (6, to_date('01-07-2023', 'dd-mm-yyyy'), 19, 15);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (18, to_date('14-07-2022', 'dd-mm-yyyy'), 131, 7);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (20, to_date('12-04-2022', 'dd-mm-yyyy'), 47, 10);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (7, to_date('19-01-2024', 'dd-mm-yyyy'), 9, 19);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (19, to_date('11-08-2023', 'dd-mm-yyyy'), 177, 3);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (6, to_date('30-01-2024', 'dd-mm-yyyy'), 203, 4);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (5, to_date('18-10-2023', 'dd-mm-yyyy'), 87, 15);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (1, to_date('17-06-2024', 'dd-mm-yyyy'), 184, 8);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (20, to_date('08-09-2024', 'dd-mm-yyyy'), 122, 9);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (4, to_date('29-09-2024', 'dd-mm-yyyy'), 89, 13);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (20, to_date('02-02-2024', 'dd-mm-yyyy'), 86, 2);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (19, to_date('31-12-2023', 'dd-mm-yyyy'), 99, 15);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (6, to_date('27-05-2024', 'dd-mm-yyyy'), 129, 6);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (4, to_date('28-09-2022', 'dd-mm-yyyy'), 95, 6);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (8, to_date('31-05-2023', 'dd-mm-yyyy'), 74, 12);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (12, to_date('14-02-2022', 'dd-mm-yyyy'), 177, 24);
commit;
prompt 200 records committed...
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (5, to_date('17-04-2023', 'dd-mm-yyyy'), 21, 16);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (4, to_date('27-03-2023', 'dd-mm-yyyy'), 36, 6);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (13, to_date('13-10-2024', 'dd-mm-yyyy'), 4, 4);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (1, to_date('25-08-2023', 'dd-mm-yyyy'), 12, 5);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (3, to_date('25-07-2024', 'dd-mm-yyyy'), 119, 13);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (11, to_date('16-02-2023', 'dd-mm-yyyy'), 183, 16);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (9, to_date('22-10-2024', 'dd-mm-yyyy'), 95, 7);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (14, to_date('15-07-2023', 'dd-mm-yyyy'), 131, 10);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (2, to_date('02-12-2024', 'dd-mm-yyyy'), 165, 20);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (1, to_date('25-06-2022', 'dd-mm-yyyy'), 156, 18);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (18, to_date('24-09-2024', 'dd-mm-yyyy'), 106, 21);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (8, to_date('10-05-2023', 'dd-mm-yyyy'), 72, 10);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (18, to_date('04-06-2023', 'dd-mm-yyyy'), 31, 24);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (8, to_date('01-01-2022', 'dd-mm-yyyy'), 133, 22);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (14, to_date('16-12-2022', 'dd-mm-yyyy'), 110, 16);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (15, to_date('23-12-2023', 'dd-mm-yyyy'), 58, 27);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (11, to_date('21-09-2022', 'dd-mm-yyyy'), 165, 9);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (8, to_date('06-08-2023', 'dd-mm-yyyy'), 46, 23);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (9, to_date('13-07-2024', 'dd-mm-yyyy'), 45, 11);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (7, to_date('28-10-2023', 'dd-mm-yyyy'), 184, 3);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (3, to_date('07-11-2024', 'dd-mm-yyyy'), 29, 3);
insert into SUPPLY (s_amount, s_date, s_id, pr_id)
values (2, to_date('24-04-2023', 'dd-mm-yyyy'), 131, 6);
commit;
prompt 222 records loaded
prompt Enabling foreign key constraints for WORKER...
alter table WORKER enable constraint SYS_C007153;
prompt Enabling foreign key constraints for WAITER...
alter table WAITER enable constraint SYS_C007161;
prompt Enabling foreign key constraints for CLIENT...
alter table CLIENT enable constraint SYS_C007149;
prompt Enabling foreign key constraints for ORDERR...
alter table ORDERR enable constraint SYS_C007167;
alter table ORDERR enable constraint SYS_C007168;
prompt Enabling foreign key constraints for CHOOSEO...
alter table CHOOSEO enable constraint SYS_C007191;
alter table CHOOSEO enable constraint SYS_C007192;
prompt Enabling foreign key constraints for CONTAINING...
alter table CONTAINING enable constraint SYS_C007173;
alter table CONTAINING enable constraint SYS_C007174;
prompt Enabling foreign key constraints for KITCHENWORKER...
alter table KITCHENWORKER enable constraint SYS_C007157;
prompt Enabling foreign key constraints for RESPONSIBLE...
alter table RESPONSIBLE enable constraint SYS_C007185;
alter table RESPONSIBLE enable constraint SYS_C007186;
prompt Enabling foreign key constraints for SUPPLY...
alter table SUPPLY enable constraint SYS_C007180;
alter table SUPPLY enable constraint SYS_C007181;
prompt Enabling triggers for MENU...
alter table MENU enable all triggers;
prompt Enabling triggers for PERSON...
alter table PERSON enable all triggers;
prompt Enabling triggers for WORKER...
alter table WORKER enable all triggers;
prompt Enabling triggers for WAITER...
alter table WAITER enable all triggers;
prompt Enabling triggers for CLIENT...
alter table CLIENT enable all triggers;
prompt Enabling triggers for ORDERR...
alter table ORDERR enable all triggers;
prompt Enabling triggers for CHOOSEO...
alter table CHOOSEO enable all triggers;
prompt Enabling triggers for PRODUCT...
alter table PRODUCT enable all triggers;
prompt Enabling triggers for CONTAINING...
alter table CONTAINING enable all triggers;
prompt Enabling triggers for KITCHENWORKER...
alter table KITCHENWORKER enable all triggers;
prompt Enabling triggers for RESPONSIBLE...
alter table RESPONSIBLE enable all triggers;
prompt Enabling triggers for SUPPLIER...
alter table SUPPLIER enable all triggers;
prompt Enabling triggers for SUPPLY...
alter table SUPPLY enable all triggers;
set feedback on
set define on
prompt Done.
