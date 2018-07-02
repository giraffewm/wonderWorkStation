/*==============================================================*/
/* Content:          ��������ϵͳ��ʼ�����루һ��ִ�У�         */
/* Creater:          Roy                                        */
/* Created Time:     2016/8/1 16:56:37                          */
/*==============================================================*/

/*==============================================================*/
/* Sequences: all                                               */
/*==============================================================*/

--�ӳٶδ��������11G R2�е�һ�������Զ�����1�����⣬����Ȩ��
--ALTER SYSTEM SET deferred_segment_creation=FALSE;

CREATE SEQUENCE SEQ_QUSERS_ID
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_QROLE_ID
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_ACCIDENT_RECORD_ID
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_CAR_ID
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_CAR_PIC_ID
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_CURRENT_UNIT_ID
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_DICTIONARY_ID
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_DRIVER_ID
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_DRIVING_RECORD_ID
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_FEES_MANAGER_ID
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_INSPECTION_RECORD_ID
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_INSURANCE_RECORD_ID
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_MAINTAIN_RECORD_ID
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_PECCANCY_RECORD_ID
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_REFUELING_RECORD_ID
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_REPAIR_RECORD_ID
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1;

/*==============================================================*/
/* Table: Q_MENU                                                */
/*==============================================================*/
create table Q_MENU  (
   ID                   VARCHAR2(50)                    not null,
   PID                  VARCHAR2(50),
   TEXT                 VARCHAR2(100),
   URL                  VARCHAR2(100),
   constraint PK_Q_MENU primary key (ID)
);

comment on table Q_MENU is
'�˵���';

comment on column Q_MENU.PID is
'����ID';

comment on column Q_MENU.TEXT is
'����';

comment on column Q_MENU.URL is
'��Ӧ��ַ';

/*==============================================================*/
/* Table: Q_ROLE                                                */
/*==============================================================*/
create table Q_ROLE  (
   ID                   NUMBER                          not null,
   NAME                 VARCHAR2(50),
   constraint PK_Q_ROLE primary key (ID)
);

comment on table Q_ROLE is
'��ɫ��';

comment on column Q_ROLE.NAME is
'��ɫ����';

/*==============================================================*/
/* Table: Q_ROLE_MENU                                           */
/*==============================================================*/
create table Q_ROLE_MENU  (
   RID                  NUMBER,
   MID                  VARCHAR2(50)
);

comment on table Q_ROLE_MENU is
'��ɫ�˵��м��';

comment on column Q_ROLE_MENU.RID is
'��ɫID';

comment on column Q_ROLE_MENU.MID is
'�˵�ID';

/*==============================================================*/
/* Table: Q_USERS                                               */
/*==============================================================*/
create table Q_USERS  (
   ID                   NUMBER                          not null,
   LNAME                VARCHAR2(50),
   LPASS                VARCHAR2(32),
   RNAME                VARCHAR2(50),
   AGE                  NUMBER,
   GENDER               VARCHAR2(1),
   ADDRESS              VARCHAR2(100),
   PHONE                VARCHAR2(11),
   DEPT_ID              NUMBER,
   POST_ID              NUMBER,
   BIRTHDAY             DATE,
   CARD                 VARCHAR2(18),
   ENTRYTIME            DATE,
   ISDISABLE            NUMBER DEFAULT(1),
   constraint PK_Q_USERS primary key (ID)
);

comment on table Q_USERS is
'�û���Ҳ��ְԱ��';

comment on column Q_USERS.LNAME is
'��¼��';

comment on column Q_USERS.LPASS is
'���룬MD5����';

comment on column Q_USERS.RNAME is
'��ʵ����';

comment on column Q_USERS.AGE is
'����';

comment on column Q_USERS.GENDER is
'�Ա�M/F';

comment on column Q_USERS.ADDRESS is
'��ַ';

comment on column Q_USERS.PHONE is
'�ֻ�';

comment on column Q_USERS.DEPT_ID is
'����ID';

comment on column Q_USERS.POST_ID is
'ְλID';

comment on column Q_USERS.BIRTHDAY is
'����';

comment on column Q_USERS.CARD is
'���֤';

comment on column Q_USERS.ENTRYTIME is
'��ְʱ��';

comment on column Q_USERS.ISDISABLE is
'�Ƿ�ͣ�ã�1��0';

/*==============================================================*/
/* Table: Q_USERS_ROLE                                          */
/*==============================================================*/
create table Q_USERS_ROLE  (
   USID                 NUMBER,
   RID                  NUMBER
);

comment on table Q_USERS_ROLE is
'�û���ɫ�м��';

comment on column Q_USERS_ROLE.USID is
'�û�ID';

comment on column Q_USERS_ROLE.RID is
'��ɫID';

/*==============================================================*/
/* Table: ACCIDENT_RECORD                                       */
/*==============================================================*/
create table ACCIDENT_RECORD  (
   ID                   NUMBER                          not null,
   CAR_ID               NUMBER,
   DRIVER_ID            NUMBER,
   ACC_DATE             TIMESTAMP,
   ACC_PLACE            VARCHAR2(100),
   ACC_EXPLAIN          VARCHAR2(200),
   WE_SITUATION         VARCHAR2(200),
   RESULT               VARCHAR2(200),
   OTHER_SITUATION      VARCHAR2(200),
   WE_AMOUNT            NUMBER(10,2),
   OTHER_AMOUNT         NUMBER(10,2),
   INS_AMOUNT           NUMBER(10,2),
   REMARKS              VARCHAR2(100),
   constraint PK_ACCIDENT_RECORD primary key (ID)
);

comment on table ACCIDENT_RECORD is
'�¹ʼ�¼';

comment on column ACCIDENT_RECORD.CAR_ID is
'����ID';

comment on column ACCIDENT_RECORD.DRIVER_ID is
'��ʻԱID';

comment on column ACCIDENT_RECORD.ACC_DATE is
'�¹�����';

comment on column ACCIDENT_RECORD.ACC_PLACE is
'�¹ʵص�';

comment on column ACCIDENT_RECORD.ACC_EXPLAIN is
'�¹�˵��';

comment on column ACCIDENT_RECORD.WE_SITUATION is
'�ҷ����';

comment on column ACCIDENT_RECORD.RESULT is
'������';

comment on column ACCIDENT_RECORD.OTHER_SITUATION is
'�Է����';

comment on column ACCIDENT_RECORD.WE_AMOUNT is
'�ҷ��е����';

comment on column ACCIDENT_RECORD.OTHER_AMOUNT is
'�Է��е����';

comment on column ACCIDENT_RECORD.INS_AMOUNT is
'���ճе����';

comment on column ACCIDENT_RECORD.REMARKS is
'��ע';

/*==============================================================*/
/* Table: CAR                                                   */
/*==============================================================*/
create table CAR  (
   ID                   NUMBER                          not null,
   CAR_NO               VARCHAR2(8),
   CAR_BRAND            NUMBER,
   CAR_MODEL            NUMBER,
   CAR_COLOR            NUMBER,
   CAR_LOAD             NUMBER(4,2),
   CAR_SEATS            NUMBER,
   OIL_WEAR             NUMBER(4,2),
   INIT_MIL             NUMBER,
   MAINTAIN_MIL         NUMBER,
   MAINTAIN_PERIOD      NUMBER,
   ENGINE_NUM           VARCHAR2(20),
   FRAME_NUM            VARCHAR(20),
   SUP_ID               NUMBER,
   PURCHASE_PRICE       NUMBER(10,2),
   PURCHASE_DATE        DATE,
   DEPT_ID              NUMBER,
   CAR_STATE            NUMBER,
   REMARKS              VARCHAR2(100),
   ISDISABLE            NUMBER DEFAULT(1),
   constraint PK_CAR primary key (ID)
);

comment on table CAR is
'��������';

comment on column CAR.CAR_NO is
'����';

comment on column CAR.CAR_BRAND is
'����Ʒ��';

comment on column CAR.CAR_MODEL is
'�����ͺ�';

comment on column CAR.CAR_COLOR is
'������ɫ';

comment on column CAR.CAR_LOAD is
'����';

comment on column CAR.CAR_SEATS is
'��λ��';

comment on column CAR.OIL_WEAR is
'�ͺ�';

comment on column CAR.INIT_MIL is
'��ʼ���';

comment on column CAR.MAINTAIN_MIL is
'�������';

comment on column CAR.MAINTAIN_PERIOD is
'��������';

comment on column CAR.ENGINE_NUM is
'��������';

comment on column CAR.FRAME_NUM is
'���ܺ�';

comment on column CAR.SUP_ID is
'��Ӧ��ID';

comment on column CAR.PURCHASE_PRICE is
'����۸�';

comment on column CAR.PURCHASE_DATE is
'��������';

comment on column CAR.DEPT_ID is
'����ID';

comment on column CAR.CAR_STATE is
'״̬';

comment on column CAR.REMARKS is
'��ע';

comment on column CAR.ISDISABLE is
'�Ƿ�ͣ�ã�1��0';

/*==============================================================*/
/* Table: CAR_PIC                                               */
/*==============================================================*/
create table CAR_PIC  (
   ID                   NUMBER                          not null,
   CID                  NUMBER,
   IMG_PATH             VARCHAR2(100),
   DES                  VARCHAR2(36),
   constraint PK_CAR_PIC primary key (ID)
);

comment on table CAR_PIC is
'����ͼƬ';

comment on column CAR_PIC.ID is
'����';

comment on column CAR_PIC.CID is
'������������';

comment on column CAR_PIC.IMG_PATH is
'ͼƬ·��';

comment on column CAR_PIC.DES is
'����';

/*==============================================================*/
/* Table: CURRENT_UNIT                                          */
/*==============================================================*/
create table CURRENT_UNIT  (
   ID                   NUMBER                          not null,
   UNIT_NAME            VARCHAR2(50),
   UNIT_TYPE            NUMBER,
   ADDRESS              VARCHAR2(100),
   TEL                  VARCHAR2(12),
   CONTACTS             VARCHAR2(50),
   REMARKS              VARCHAR2(100),
   ISDISABLE            NUMBER DEFAULT(1),
   constraint PK_CURRENT_UNIT primary key (ID)
);

comment on table CURRENT_UNIT is
'������λ';

comment on column CURRENT_UNIT.UNIT_NAME is
'��λ����';

comment on column CURRENT_UNIT.UNIT_TYPE is
'��λ����ID';

comment on column CURRENT_UNIT.ADDRESS is
'��ַ';

comment on column CURRENT_UNIT.TEL is
'�绰';

comment on column CURRENT_UNIT.CONTACTS is
'��ϵ��';

comment on column CURRENT_UNIT.REMARKS is
'��ע';

/*==============================================================*/
/* Table: DICTIONARY                                            */
/*==============================================================*/
create table DICTIONARY  (
   ID                   NUMBER                          not null,
   PID                  NUMBER,
   TEXT                 VARCHAR2(20),
   LEV                  NUMBER,
   ISDISABLE            NUMBER DEFAULT(1),
   constraint PK_DICTIONARY primary key (ID)
);

comment on table DICTIONARY is
'�ֵ��';

comment on column DICTIONARY.ID is
'����';

comment on column DICTIONARY.PID is
'����ID';

comment on column DICTIONARY.TEXT is
'����';

comment on column DICTIONARY.ISDISABLE is
'�Ƿ�ͣ��1,0';

/*==============================================================*/
/* Table: DRIVER                                                */
/*==============================================================*/
create table DRIVER  (
   ID                   NUMBER                          not null,
   NAME                 VARCHAR2(50),
   DEPT_ID              NUMBER,
   GENDER               VARCHAR2(1),
   BIRTHDAY             DATE,
   CARD                 VARCHAR2(18),
   PHONE                VARCHAR2(11),
   ENTRYTIME            DATE,
   ADDRESS              VARCHAR2(100),
   DRIVER_NO            VARCHAR2(18),
   DRIVER_TYPE          NUMBER,
   REMARKS              VARCHAR2(100),
   ISDISABLE            NUMBER DEFAULT(1),
   constraint PK_DRIVER primary key (ID)
);

comment on table DRIVER is
'��ʻԱ��';

comment on column DRIVER.NAME is
'����';
comment on column DRIVER.DEPT_ID is
'����ID';

comment on column DRIVER.GENDER is
'�Ա�';

comment on column DRIVER.BIRTHDAY is
'����
';

comment on column DRIVER.CARD is
'���֤';

comment on column DRIVER.PHONE is
'�ֻ�';

comment on column DRIVER.ENTRYTIME is
'��ְʱ��';

comment on column DRIVER.ADDRESS is
'סַ';

comment on column DRIVER.DRIVER_NO is
'���պ���';

comment on column DRIVER.DRIVER_TYPE is
'׼������ID';

comment on column DRIVER.REMARKS is
'��ע';

comment on column DRIVER.ISDISABLE is
'�Ƿ����ã�1��0';

/*==============================================================*/
/* Table: DRIVING_RECORD                                        */
/*==============================================================*/
create table DRIVING_RECORD  (
   ID                   NUMBER                          not null,
   CAR_ID               NUMBER,
   DEPT_ID              NUMBER,
   BEGIN_TIME           TIMESTAMP,
   PRE_BACKTIME         TIMESTAMP,
   BACKTIME             TIMESTAMP,
   PERSONNEL            VARCHAR2(50),
   DRIVER_ID            NUMBER,
   DESTINATION          VARCHAR2(100),
   REASON               VARCHAR2(100),
   START_MIL            NUMBER(10,2),
   RETURN_MIL           NUMBER(10,2),
   THIS_MIL             NUMBER,
   PARK_PLACE           VARCHAR2(100),
   REMARKS              VARCHAR2(100),
   CREATE_UID           NUMBER,
   constraint PK_DRIVING_RECORD primary key (ID)
);

comment on table DRIVING_RECORD is
'������¼��';

comment on column DRIVING_RECORD.CAR_ID is
'����ID';

comment on column DRIVING_RECORD.DEPT_ID is
'����ID';

comment on column DRIVING_RECORD.BEGIN_TIME is
'����ʱ��';

comment on column DRIVING_RECORD.PRE_BACKTIME is
'Ԥ�ƻس�ʱ��';

comment on column DRIVING_RECORD.BACKTIME is
'�س�ʱ��';

comment on column DRIVING_RECORD.PERSONNEL is
'�ó���';

comment on column DRIVING_RECORD.DRIVER_ID is
'��ʻԱID';

comment on column DRIVING_RECORD.DESTINATION is
'Ŀ�ĵ�';

comment on column DRIVING_RECORD.REASON is
'�ó�ԭ��';

comment on column DRIVING_RECORD.START_MIL is
'�������';

comment on column DRIVING_RECORD.RETURN_MIL is
'�س����';

comment on column DRIVING_RECORD.THIS_MIL is
'�������';

comment on column DRIVING_RECORD.PARK_PLACE is
'ͣ��λ��';

comment on column DRIVING_RECORD.REMARKS is
'�س���ע';

comment on column DRIVING_RECORD.CREATE_UID is
'������';

/*==============================================================*/
/* Table: FEES_MANAGER                                          */
/*==============================================================*/
create table FEES_MANAGER  (
   ID                   NUMBER                          not null,
   CAR_ID               NUMBER,
   FEES_NAME            VARCHAR2(50),
   FEES_DATE            TIMESTAMP,
   FEES_AMOUNT          NUMBER(10,2),
   FEES_UNIT            NUMBER,
   OPERATOR             NUMBER,
   REMARKS              VARCHAR2(100),
   constraint PK_FEES_MANAGER primary key (ID)
);

comment on table FEES_MANAGER is
'��Ѽ�¼��';

comment on column FEES_MANAGER.CAR_ID is
'����ID';

comment on column FEES_MANAGER.FEES_NAME is
'��������';

comment on column FEES_MANAGER.FEES_DATE is
'�ɷ�����';

comment on column FEES_MANAGER.FEES_AMOUNT is
'�ɷѽ��';

comment on column FEES_MANAGER.FEES_UNIT is
'�շѵ�λ';

comment on column FEES_MANAGER.OPERATOR is
'������';

comment on column FEES_MANAGER.REMARKS is
'��ע';

/*==============================================================*/
/* Table: INSPECTION_RECORD                                     */
/*==============================================================*/
create table INSPECTION_RECORD  (
   ID                   NUMBER                          not null,
   CAR_ID               NUMBER,
   INS_NO               VARCHAR2(50),
   INS_DATE             DATE,
   INS_AMOUNT           NUMBER(10,2),
   VAO_ID               NUMBER,
   EXPIRE_DATE          DATE,
   OPERATOR             NUMBER,
   REMARKS              VARCHAR2(100),
   constraint PK_INSPECTION_RECORD primary key (ID)
);

comment on table INSPECTION_RECORD is
'����¼��';

comment on column INSPECTION_RECORD.CAR_ID is
'����ID';

comment on column INSPECTION_RECORD.INS_NO is
'����־��';

comment on column INSPECTION_RECORD.INS_DATE is
'�������';

comment on column INSPECTION_RECORD.INS_AMOUNT is
'������';

comment on column INSPECTION_RECORD.VAO_ID is
'������ID';

comment on column INSPECTION_RECORD.EXPIRE_DATE is
'��������';

comment on column INSPECTION_RECORD.OPERATOR is
'������';

comment on column INSPECTION_RECORD.REMARKS is
'��ע';

/*==============================================================*/
/* Table: INSURANCE_RECORD                                      */
/*==============================================================*/
create table INSURANCE_RECORD  (
   ID                   NUMBER                          not null,
   CAR_ID               NUMBER,
   INS_NO               VARCHAR2(50),
   INS_DATE             DATE,
   INS_TYPE             NUMBER,
   INS_AMOUNT           NUMBER(10,2),
   INS_UNIT             NUMBER,
   EXPIRE_DATE          DATE,
   OPERATOR             NUMBER,
   REMARKS              VARCHAR2(100),
   constraint PK_INSURANCE_RECORD primary key (ID)
);

comment on table INSURANCE_RECORD is
'���ռ�¼';

comment on column INSURANCE_RECORD.CAR_ID is
'����ID';

comment on column INSURANCE_RECORD.INS_NO is
'������';

comment on column INSURANCE_RECORD.INS_DATE is
'��������';

comment on column INSURANCE_RECORD.INS_TYPE is
'��������';

comment on column INSURANCE_RECORD.INS_AMOUNT is
'���ս��';

comment on column INSURANCE_RECORD.INS_UNIT is
'���չ�˾';

comment on column INSURANCE_RECORD.EXPIRE_DATE is
'��������';

comment on column INSURANCE_RECORD.OPERATOR is
'������';

comment on column INSURANCE_RECORD.REMARKS is
'��ע';

/*==============================================================*/
/* Table: MAINTAIN_RECORD                                       */
/*==============================================================*/
create table MAINTAIN_RECORD  (
   ID                   NUMBER                          not null,
   CAR_ID               NUMBER                          not null,
   MAIN_TYPE            NUMBER,
   MAIN_DATE            DATE,
   MAIN_AMOUNT          NUMBER(10,2),
   MAIN_UNIT            NUMBER,
   MAIN_MIL             NUMBER(10,2),
   MAIN_CONTENT         VARCHAR2(200),
   NEXT_DATE            DATE,
   NEXT_MIL             NUMBER(10,2),
   OPERATOR             NUMBER,
   REMARKS              VARCHAR2(100),
   constraint PK_MAINTAIN_RECORD primary key (ID, CAR_ID)
);

comment on table MAINTAIN_RECORD is
'������¼��';

comment on column MAINTAIN_RECORD.CAR_ID is
'����ID';

comment on column MAINTAIN_RECORD.MAIN_TYPE is
'��������ID';

comment on column MAINTAIN_RECORD.MAIN_DATE is
'��������';

comment on column MAINTAIN_RECORD.MAIN_AMOUNT is
'�������';

comment on column MAINTAIN_RECORD.MAIN_UNIT is
'������λID';

comment on column MAINTAIN_RECORD.MAIN_MIL is
'�������';

comment on column MAINTAIN_RECORD.MAIN_CONTENT is
'��������';

comment on column MAINTAIN_RECORD.NEXT_DATE is
'�´α�������';

comment on column MAINTAIN_RECORD.NEXT_MIL is
'�´α������';

comment on column MAINTAIN_RECORD.OPERATOR is
'������';

comment on column MAINTAIN_RECORD.REMARKS is
'��ע';

/*==============================================================*/
/* Table: PECANCY_RECCORD                                        */
/*==============================================================*/
create table PECCANCY_RECORD  (
   ID                   NUMBER                          not null,
   CAR_ID               NUMBER                          not null,
   PEC_OPTION           NUMBER,
   PEC_DATE             TIMESTAMP,
   FINE                 NUMBER(10,2),
   POINTS               NUMBER,
   DRIVER_ID            NUMBER,
   PEC_PLACE            VARCHAR2(100),
   REMARKS              VARCHAR2(100),
   constraint PK_PECCANCY_RECORD primary key (ID)
);

comment on table PECCANCY_RECORD is
'Υ�¼�¼��';

comment on column PECCANCY_RECORD.CAR_ID is
'����ID';

comment on column PECCANCY_RECORD.PEC_OPTION is
'Υ����ĿID';

comment on column PECCANCY_RECORD.PEC_DATE is
'Υ��ʱ��';

comment on column PECCANCY_RECORD.FINE is
'����';

comment on column PECCANCY_RECORD.POINTS is
'�۷�';

comment on column PECCANCY_RECORD.DRIVER_ID is
'��ʻԱ';

comment on column PECCANCY_RECORD.PEC_PLACE is
'Υ�µص�';

comment on column PECCANCY_RECORD.REMARKS is
'��ע';

/*==============================================================*/
/* Table: REFUELING_RECORD                                      */
/*==============================================================*/
create table REFUELING_RECORD  (
   ID                   NUMBER                          not null,
   CAR_ID               NUMBER,
   OIL_STATION_ID       NUMBER,
   OIL_DATE             TIMESTAMP,
   OIL_LABEL            NUMBER,
   UNIT_PRICE           NUMBER(5,2),
   TOTAL_AMOUNT         NUMBER(5,2),
   THIS_MIL             NUMBER,
   LAST_MIL             NUMBER,
   THIS_GAS_VOLUME      NUMBER(5,2),
   LAST_GAS_VOLUME      NUMBER(5,2),
   OPERATOR             NUMBER,
   REMARKS              VARCHAR2(100),
   constraint PK_REFUELING_RECORD primary key (ID)
);

comment on table REFUELING_RECORD is
'���ͼ�¼��';

comment on column REFUELING_RECORD.CAR_ID is
'����ID';

comment on column REFUELING_RECORD.OIL_STATION_ID is
'����վID';

comment on column REFUELING_RECORD.OIL_DATE is
'��������';

comment on column REFUELING_RECORD.OIL_LABEL is
'���ϱ��ID';

comment on column REFUELING_RECORD.UNIT_PRICE is
'����';

comment on column REFUELING_RECORD.TOTAL_AMOUNT is
'�ܽ��';

comment on column REFUELING_RECORD.THIS_MIL is
'�������';

comment on column REFUELING_RECORD.LAST_MIL is
'�ϴ����';

comment on column REFUELING_RECORD.THIS_GAS_VOLUME is
'��������';

comment on column REFUELING_RECORD.LAST_GAS_VOLUME is
'�ϴ�����';

comment on column REFUELING_RECORD.OPERATOR is
'������';

comment on column REFUELING_RECORD.REMARKS is
'��ע';

/*==============================================================*/
/* Table: REPAIR_RECORD                                         */
/*==============================================================*/
create table REPAIR_RECORD  (
   ID                   NUMBER                          not null,
   CAR_ID               NUMBER,
   REPAIR_DEPOT_ID      NUMBER,
   SEND_TIME            TIMESTAMP,
   ESTIMATE_TIME        TIMESTAMP,
   SEND_REASON          VARCHAR2(200),
   SEND_REMARKS         VARCHAR2(200),
   OPERATOR             NUMBER,
   REPAIR_TYPE          NUMBER,
   GET_TIME             TIMESTAMP,
   REPAIR_COST          NUMBER(10,2),
   REPAIR_OPTION        VARCHAR2(200),
   USE_STUFF            VARCHAR2(200),
   GET_REMARKS          VARCHAR2(200),
   constraint PK_REPAIR_RECORD primary key (ID)
);

comment on table REPAIR_RECORD is
'ά�޼�¼��';

comment on column REPAIR_RECORD.ID is
'����';

comment on column REPAIR_RECORD.CAR_ID is
'����ID';

comment on column REPAIR_RECORD.REPAIR_DEPOT_ID is
'����ID';

comment on column REPAIR_RECORD.SEND_TIME is
'��������';

comment on column REPAIR_RECORD.ESTIMATE_TIME is
'Ԥ��ȡ������';

comment on column REPAIR_RECORD.SEND_REASON is
'����ԭ��';

comment on column REPAIR_RECORD.SEND_REMARKS is
'���ޱ�ע';

comment on column REPAIR_RECORD.OPERATOR is
'������ID';

comment on column REPAIR_RECORD.REPAIR_TYPE is
'ά�����ID';

comment on column REPAIR_RECORD.GET_TIME is
'ȡ������';

comment on column REPAIR_RECORD.REPAIR_COST is
'ά�޷���';

comment on column REPAIR_RECORD.REPAIR_OPTION is
'ά����Ŀ';

comment on column REPAIR_RECORD.USE_STUFF is
'ʹ�ò���';

comment on column REPAIR_RECORD.GET_REMARKS is
'ȡ����ע';

alter table ACCIDENT_RECORD
   add constraint FK_ACCIDENT_CAR foreign key (CAR_ID)
      references CAR (ID);

alter table ACCIDENT_RECORD
   add constraint FK_ACCIDENT_DRIVER foreign key (DRIVER_ID)
      references DRIVER (ID);

alter table CAR
   add constraint FK_CAR_MODEL_DIC foreign key (CAR_MODEL)
      references DICTIONARY (ID);

alter table CAR
   add constraint FK_CAR_COLOR_DIC foreign key (CAR_COLOR)
      references DICTIONARY (ID);

alter table CAR
   add constraint FK_CAR_DEPTID_DIC foreign key (DEPT_ID)
      references DICTIONARY (ID);

alter table CAR
   add constraint FK_CAR_SUP_CURRENT foreign key (SUP_ID)
      references CURRENT_UNIT (ID);

alter table CAR
   add constraint FK_CAR_BRAND_DIC foreign key (CAR_BRAND)
      references DICTIONARY (ID);

alter table CAR_PIC
   add constraint FK_CAR_PIC_CAR foreign key (CID)
      references CAR (ID);

alter table CURRENT_UNIT
   add constraint FK_CUR_UNITTYPE_DIC foreign key (UNIT_TYPE)
      references DICTIONARY (ID);

alter table DRIVER
   add constraint FK_DEPT_DIC foreign key (DEPT_ID)
      references DICTIONARY (ID);

alter table DRIVER
   add constraint FK_DRIVER_TYPE_DIC foreign key (DRIVER_TYPE)
      references DICTIONARY (ID);

alter table DRIVING_RECORD
   add constraint FK_DRIVING_CAR foreign key (CAR_ID)
      references CAR (ID);

alter table DRIVING_RECORD
   add constraint FK_DRIVING_DIC foreign key (DEPT_ID)
      references DICTIONARY (ID);
      
alter table DRIVING_RECORD
   add constraint FK_DRIVING_DRIVER foreign key (DRIVER_ID)
      references DRIVER (ID);

alter table DRIVING_RECORD
   add constraint FK_DRIVING_CREATEUSERS foreign key (CREATE_UID)
      references Q_USERS (ID);

alter table FEES_MANAGER
   add constraint FK_FEESMAN_CAR foreign key (CAR_ID)
      references CAR (ID);

alter table FEES_MANAGER
   add constraint FK_FEES_MAN_UNIT foreign key (FEES_UNIT)
      references CURRENT_UNIT (ID);

alter table FEES_MANAGER
   add constraint FK_FEES_MAN_USERS foreign key (OPERATOR)
      references DRIVER (ID);

alter table INSPECTION_RECORD
   add constraint FK_INSPECTI_CAR foreign key (CAR_ID)
      references CAR (ID);

alter table INSPECTION_RECORD
   add constraint FK_INSPECTI_UNIT foreign key (VAO_ID)
      references CURRENT_UNIT (ID);

alter table INSURANCE_RECORD
   add constraint FK_INSURANC_CAR foreign key (CAR_ID)
      references CAR (ID);

alter table INSURANCE_RECORD
   add constraint FK_INSURANC_CURRENT_ foreign key (INS_UNIT)
      references CURRENT_UNIT (ID);

alter table INSURANCE_RECORD
   add constraint FK_INSURANC_USERS foreign key (OPERATOR)
      references Q_USERS (ID);

alter table MAINTAIN_RECORD
   add constraint FK_MAINTAIN_CAR foreign key (CAR_ID)
      references CAR (ID);

alter table MAINTAIN_RECORD
   add constraint FK_MAINTAIN_UNIT foreign key (MAIN_UNIT)
      references CURRENT_UNIT (ID);

alter table MAINTAIN_RECORD
   add constraint FK_MAINTAIN_USERS foreign key (OPERATOR)
      references DRIVER (ID);

alter table PECCANCY_RECORD
   add constraint FK_PECCANCY_CAR foreign key (CAR_ID)
      references CAR (ID);

alter table PECCANCY_RECORD
   add constraint FK_PECCANCY__DIC foreign key (PEC_OPTION)
      references DICTIONARY (ID);

alter table PECCANCY_RECORD
   add constraint FK_PECCANCY_DRIVER foreign key (DRIVER_ID)
      references DRIVER (ID);

alter table Q_ROLE_MENU
   add constraint FK_RM_ROLE foreign key (RID)
      references Q_ROLE (ID);

alter table Q_ROLE_MENU
   add constraint FK_RM_MENU foreign key (MID)
      references Q_MENU (ID);

alter table Q_USERS
   add constraint FK_USERS_DIC foreign key (DEPT_ID)
      references DICTIONARY (ID);

alter table Q_USERS_ROLE
   add constraint FK_UR_USERS foreign key (USID)
      references Q_USERS (ID);

alter table Q_USERS_ROLE
   add constraint FK_UR_ROLE foreign key (RID)
      references Q_ROLE (ID);

alter table REFUELING_RECORD
   add constraint FK_CAR_ID_CAR foreign key (CAR_ID)
      references CAR (ID);

alter table REFUELING_RECORD
   add constraint FK_OSI_CURRENTUNIT foreign key (OIL_STATION_ID)
      references CURRENT_UNIT (ID);
      
alter table REFUELING_RECORD
   add constraint FK_OSI_DICTIONARY foreign key (OIL_LABEL)
      references DICTIONARY (ID);
      
alter table REFUELING_RECORD
   add constraint FK_OSI_DRIVER foreign key (OPERATOR)
      references DRIVER (ID);

alter table REPAIR_RECORD
   add constraint FK_REPAIR_CAR foreign key (CAR_ID)
      references CAR (ID);

alter table REPAIR_RECORD
   add constraint FK_REPAIR_UNIT foreign key (REPAIR_DEPOT_ID)
      references CURRENT_UNIT (ID);

alter table REPAIR_RECORD
   add constraint FK_REPAIRTYPE_DIC foreign key (REPAIR_TYPE)
      references DICTIONARY (ID);

------------------------------��������-------------------------------------
--��Ӳ���һ����Ϣ
INSERT INTO DICTIONARY(ID,TEXT,LEV)
VALUES(SEQ_DICTIONARY_ID.NEXTVAL,'����',1);
COMMIT;

INSERT INTO DICTIONARY(ID,TEXT,LEV)
VALUES(SEQ_DICTIONARY_ID.NEXTVAL,'������ɫ',1);
COMMIT;

INSERT INTO DICTIONARY(ID,TEXT,LEV)
VALUES(SEQ_DICTIONARY_ID.NEXTVAL,'����Ʒ��',1);
COMMIT;

/*
INSERT INTO DICTIONARY(ID,TEXT)
VALUES(SEQ_DICTIONARY_ID.NEXTVAL,'�����ͺ�',1);
COMMIT;
*/

INSERT INTO DICTIONARY(ID,TEXT,LEV)
VALUES(SEQ_DICTIONARY_ID.NEXTVAL,'��λ����',1);
COMMIT;

INSERT INTO DICTIONARY(ID,TEXT,LEV)
VALUES(SEQ_DICTIONARY_ID.NEXTVAL,'ά�����',1);
COMMIT;

INSERT INTO DICTIONARY(ID,TEXT,LEV)
VALUES(SEQ_DICTIONARY_ID.NEXTVAL,'�������',1);
COMMIT;

INSERT INTO DICTIONARY(ID,TEXT,LEV)
VALUES(SEQ_DICTIONARY_ID.NEXTVAL,'Υ����Ŀ',1);
COMMIT;

INSERT INTO DICTIONARY(ID,TEXT,LEV)
VALUES(SEQ_DICTIONARY_ID.NEXTVAL,'��������',1);
COMMIT;

INSERT INTO DICTIONARY(ID,TEXT,LEV)
VALUES(SEQ_DICTIONARY_ID.NEXTVAL,'��������',1);
COMMIT;

INSERT INTO DICTIONARY(ID,TEXT,LEV)
VALUES(SEQ_DICTIONARY_ID.NEXTVAL,'ְ��',1);
COMMIT;

INSERT INTO DICTIONARY(ID,TEXT,LEV)
VALUES(SEQ_DICTIONARY_ID.NEXTVAL,'��������',1);
COMMIT;

/*INSERT INTO DICTIONARY(ID,TEXT,LEV)
VALUES(SEQ_DICTIONARY_ID.NEXTVAL,'����״̬',1);
COMMIT;*/

INSERT INTO DICTIONARY(ID,TEXT,LEV)
VALUES(SEQ_DICTIONARY_ID.NEXTVAL,'���ϱ��',1);
COMMIT;


--����û���������
INSERT INTO Q_USERS
VALUES(SEQ_QUSERS_ID.nextval,
'admin',
'21232f297a57a5a743894a0e4a801fc3',
'��������Ա',20,'M','����','12345678900',1,1,
SYSDATE,'610111199001012222',SYSDATE,DEFAULT);
COMMIT;

INSERT INTO Q_USERS
VALUES(SEQ_QUSERS_ID.nextval,'roy',
'd4c285227493531d0577140a1ed03964',
'����һ',30,'M','����','12345678900',1,1,
SYSDATE,'610111199001022222',SYSDATE,DEFAULT);
COMMIT;

INSERT INTO Q_USERS
VALUES(SEQ_QUSERS_ID.nextval,'lily',
'89f288757f4d0693c99b007855fc075e','����',20,'F','����','12345678900',1,1,
SYSDATE,'610111199001032222',SYSDATE,DEFAULT);
COMMIT;

--��Ӳ˵���������

--��Ŀ¼
INSERT into Q_MENU
VALUES('L1',null,'��ҵ��������ϵͳ',null);
COMMIT;

--һ���˵�
INSERT INTO Q_MENU
VALUES('L101','L1','�ճ�����',null);
INSERT into Q_MENU
VALUES('L102','L1','����״̬',null);
INSERT INTO Q_MENU
VALUES('L103','L1','��������',null);
INSERT into Q_MENU
VALUES('L104','L1','��������',null);
INSERT into Q_MENU
VALUES('L105','L1','��������',null);
INSERT into Q_MENU
VALUES('L106','L1','ϵͳ����',null);
COMMIT;

--�����˵�
INSERT INTO Q_MENU
VALUES('L10101','L101','������¼','DailyHandle/CarOut_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10102','L101','���ͼ�¼','DailyHandle/Gas_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10103','L101','ά�޼�¼','DailyHandle/Repair_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10104','L101','��Ѽ�¼','DailyHandle/Fees_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10105','L101','������¼','DailyHandle/Maintain_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10106','L101','Υ�¼�¼','DailyHandle/Peccancy_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10107','L101','�¹ʼ�¼','DailyHandle/Accident_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10108','L101','����¼','DailyHandle/Inspection_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10109','L101','���ռ�¼','DailyHandle/Insurance_Record.jsp');
COMMIT;

INSERT INTO Q_MENU
VALUES('L10201','L102','����״̬','CarState/CarState.jsp');
COMMIT;

INSERT INTO Q_MENU
VALUES('L10301','L103','��������','ExpirationReminder/Reminder.jsp');
COMMIT;

INSERT INTO Q_MENU
VALUES('L10401','L104','�������öԱ�','Report/Report_1.jsp');
INSERT INTO Q_MENU
VALUES('L10402','L104','�������÷ֲ�','Report/Report_2.jsp');
COMMIT;

INSERT INTO Q_MENU
VALUES('L10501','L105','ϵͳ�ֵ�','BasicSet/Sys_Dictionary.jsp');
INSERT INTO Q_MENU
VALUES('L10502','L105','��ʻԱ����','BasicSet/Driver_INFO.jsp');
INSERT INTO Q_MENU
VALUES('L10503','L105','������λ','BasicSet/Current_Unit.jsp');
INSERT INTO Q_MENU
VALUES('L10504','L105','��������','BasicSet/Vehicle_File.jsp');
/*INSERT INTO Q_MENU
VALUES('L10505','L105','ְԱ��Ϣ','BasicSet/Employees_INFO.jsp');*/
COMMIT;

INSERT INTO Q_MENU
VALUES('L10601','L106','��ɫ����','SysSet/Role_Management.jsp');
INSERT INTO Q_MENU
VALUES('L10602','L106','�û�����','SysSet/User_Management.jsp');
INSERT INTO Q_MENU
VALUES('L10603','L106','�޸�����','SysSet/Modify_Password.jsp');
COMMIT;

--��ӽ�ɫ��������
INSERT INTO Q_ROLE VALUES(SEQ_QROLE_ID.Nextval,'����Ա');
INSERT INTO Q_ROLE VALUES(SEQ_QROLE_ID.Nextval,'Ա��');
INSERT INTO Q_ROLE VALUES(SEQ_QROLE_ID.Nextval,'��������');
INSERT INTO Q_ROLE VALUES(SEQ_QROLE_ID.Nextval,'�ܾ���');
COMMIT;

--��ӽ�ɫ�˵���������

INSERT INTO Q_ROLE_MENU VALUES(2,'L1');
INSERT INTO Q_ROLE_MENU VALUES(2,'L101');
INSERT INTO Q_ROLE_MENU VALUES(2,'L10101');

INSERT INTO Q_ROLE_MENU VALUES(4,'L1');
INSERT INTO Q_ROLE_MENU VALUES(4,'L104');
INSERT INTO Q_ROLE_MENU VALUES(4,'L10401');

--����û���ɫ��������
INSERT INTO Q_USERS_ROLE VALUES(2,4);
INSERT INTO Q_USERS_ROLE VALUES(2,2);
COMMIT;

--��Ӽ�ʻԱ��Ϣ
INSERT INTO DRIVER(ID,NAME,DEPT_ID,GENDER,BIRTHDAY,
CARD,PHONE,ENTRYTIME,ADDRESS,DRIVER_NO,
DRIVER_TYPE,REMARKS,ISDISABLE)
VALUES(SEQ_DRIVER_ID.NEXTVAL,'�����',NULL,'M',SYSDATE,'610111198307062251',
'13759951277',SYSDATE,'���ׯ','610111198307062251',NULL,'���С����',DEFAULT);
COMMIT;

INSERT INTO DRIVER(ID,NAME,DEPT_ID,GENDER,BIRTHDAY,
CARD,PHONE,ENTRYTIME,ADDRESS,DRIVER_NO,
DRIVER_TYPE,REMARKS,ISDISABLE)
VALUES(SEQ_DRIVER_ID.NEXTVAL,'�����',NULL,'M',SYSDATE,'610111198307072251',
'13759951277',SYSDATE,'ɳ����','610111198307072251',NULL,'��̥̫��',DEFAULT);
COMMIT;

INSERT INTO DRIVER(ID,NAME,DEPT_ID,GENDER,BIRTHDAY,
CARD,PHONE,ENTRYTIME,ADDRESS,DRIVER_NO,
DRIVER_TYPE,REMARKS,ISDISABLE)
VALUES(SEQ_DRIVER_ID.NEXTVAL,'���ú�',NULL,'F',SYSDATE,'610111198307082251',
'13759951277',SYSDATE,'�����','610111198307082251',NULL,'ֱ��̫��',DEFAULT);
COMMIT;

INSERT INTO DRIVER(ID,NAME,DEPT_ID,GENDER,BIRTHDAY,
CARD,PHONE,ENTRYTIME,ADDRESS,DRIVER_NO,
DRIVER_TYPE,REMARKS,ISDISABLE)
VALUES(SEQ_DRIVER_ID.NEXTVAL,'���ߺ�',NULL,'F',SYSDATE,'610111198307092251',
'13759951277',SYSDATE,'����կ','610111198307092251',NULL,'˦βһ��',DEFAULT);
COMMIT;

INSERT INTO DRIVER(ID,NAME,DEPT_ID,GENDER,BIRTHDAY,
CARD,PHONE,ENTRYTIME,ADDRESS,DRIVER_NO,
DRIVER_TYPE,REMARKS,ISDISABLE)
VALUES(SEQ_DRIVER_ID.NEXTVAL,'�滢��',NULL,'M',SYSDATE,'610111198307012251',
'13759951277',SYSDATE,'����ׯ','610111198307012251',NULL,'���С����',DEFAULT);
COMMIT;

--���������λ��Ϣ
INSERT INTO CURRENT_UNIT(ID,UNIT_NAME,UNIT_TYPE,ADDRESS,TEL,CONTACTS,REMARKS,ISDISABLE)
VALUES(SEQ_CURRENT_UNIT_ID.NEXTVAL,'�ӳ����ƴ���������վ',NULL,'����·','029-82603321','������','��ĩ��Ϣ',DEFAULT);
COMMIT;

INSERT INTO CURRENT_UNIT(ID,UNIT_NAME,UNIT_TYPE,ADDRESS,TEL,CONTACTS,REMARKS,ISDISABLE)
VALUES(SEQ_CURRENT_UNIT_ID.NEXTVAL,'�ӳ�����̫��·����վ',NULL,'̫��·����','029-82634621','������','������Ϣ',DEFAULT);
COMMIT;

INSERT INTO CURRENT_UNIT(ID,UNIT_NAME,UNIT_TYPE,ADDRESS,TEL,CONTACTS,REMARKS,ISDISABLE)
VALUES(SEQ_CURRENT_UNIT_ID.NEXTVAL,'�㱾����4S��',NULL,'��Ӱ·','029-82603322','ʦ��','������Ϣ',DEFAULT);
COMMIT;

INSERT INTO CURRENT_UNIT(ID,UNIT_NAME,UNIT_TYPE,ADDRESS,TEL,CONTACTS,REMARKS,ISDISABLE)
VALUES(SEQ_CURRENT_UNIT_ID.NEXTVAL,'��屴���4S��',NULL,'ͨԴ·','029-85603323','����','������Ϣ',DEFAULT);
COMMIT;

INSERT INTO CURRENT_UNIT(ID,UNIT_NAME,UNIT_TYPE,ADDRESS,TEL,CONTACTS,REMARKS,ISDISABLE)
VALUES(SEQ_CURRENT_UNIT_ID.NEXTVAL,'���°µ�4S��',NULL,'����·','029-89603342','����','������Ϣ',DEFAULT);
COMMIT;

INSERT INTO CURRENT_UNIT(ID,UNIT_NAME,UNIT_TYPE,ADDRESS,TEL,CONTACTS,REMARKS,ISDISABLE)
VALUES(SEQ_CURRENT_UNIT_ID.NEXTVAL,'����������',NULL,'����·','029-82603323','������','��ĩ��Ϣ',DEFAULT);
COMMIT;

INSERT INTO CURRENT_UNIT(ID,UNIT_NAME,UNIT_TYPE,ADDRESS,TEL,CONTACTS,REMARKS,ISDISABLE)
VALUES(SEQ_CURRENT_UNIT_ID.NEXTVAL,'ƽ������',NULL,'�ƴ�·','029-82603324','ͯ����','��ĩ��Ϣ',DEFAULT);
COMMIT;

INSERT INTO CURRENT_UNIT(ID,UNIT_NAME,UNIT_TYPE,ADDRESS,TEL,CONTACTS,REMARKS,ISDISABLE)
VALUES(SEQ_CURRENT_UNIT_ID.NEXTVAL,'��֯�Ǹ����շ�վ',NULL,'������·','029-82603325','���','����Ϣ',DEFAULT);
COMMIT;

--��ӳ�����Ϣ
INSERT INTO CAR
VALUES(SEQ_CAR_ID.NEXTVAL,'��A88888',NULL,NULL,1,
1.5,5,6.5,100,7500,6,'2200480','LHRP20160102001',
NULL,240000.12,SYSDATE,NULL,1,'��ע',DEFAULT);
COMMIT;

INSERT INTO CAR
VALUES(SEQ_CAR_ID.NEXTVAL,'��A66666',NULL,NULL,1,
2.0,5,11.0,50,10000,6,'5500661','QHRP20150102002',
NULL,550000.00,SYSDATE,NULL,1,'��ע',DEFAULT);
COMMIT;

INSERT INTO CAR
VALUES(SEQ_CAR_ID.NEXTVAL,'��A00001',NULL,NULL,1,
1.6,5,10.0,20,10000,6,'6600661','UYAQP20150102002',
NULL,1050000.00,SYSDATE,NULL,1,'��ע',DEFAULT);
COMMIT;

---------����ֵ�����
DECLARE
V_ID DICTIONARY.ID%TYPE;
V1 DICTIONARY.ID%TYPE;
V2 DICTIONARY.ID%TYPE;
V3 DICTIONARY.ID%TYPE;
V4 DICTIONARY.ID%TYPE;
V5 DICTIONARY.ID%TYPE;

BEGIN
     --��������
     SELECT ID INTO V_ID FROM DICTIONARY WHERE TEXT='����'; 
     
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'�ܾ���',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'ά����',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'������',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'�г���',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'���ڰ�',2);
     COMMIT;
     
     --������ɫ
     /*SELECT ID INTO V_ID FROM DICTIONARY WHERE TEXT='������ɫ'; 
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'��ɫ',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'��ɫ',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'��ɫ',2);
     COMMIT;*/
     
     --����Ʒ��
     SELECT ID INTO V_ID FROM DICTIONARY WHERE TEXT='����Ʒ��'; 
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'����',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'�µ�',2);
     COMMIT;
     
     --�����ͺ�
     SELECT ID INTO V_ID FROM DICTIONARY WHERE TEXT='����'; 
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'������',3);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'�ݴ�',3);
     COMMIT;
     
     SELECT ID INTO V_ID FROM DICTIONARY WHERE TEXT='�µ�'; 
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'A6L',3);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'A8',3);
     COMMIT;
     
     --��λ����
     SELECT ID INTO V_ID FROM DICTIONARY WHERE TEXT='��λ����'; 
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'4S�̼�',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'����վ',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'������',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'���չ�˾',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'����',2);
     COMMIT;
     
     --ά�����
     SELECT ID INTO V_ID FROM DICTIONARY WHERE TEXT='ά�����'; 
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'Сά��',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'��ά��',2);
     COMMIT;
     
     --�������
     SELECT ID INTO V_ID FROM DICTIONARY WHERE TEXT='�������'; 
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'�ճ�����',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'����',2);
     COMMIT;
     
     --Υ����Ŀ
     SELECT ID INTO V_ID FROM DICTIONARY WHERE TEXT='Υ����Ŀ'; 
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'δ����ʾͣ��',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'�����',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'�Ƽ�',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'����',2);
     COMMIT;
     
     --��������
     SELECT ID INTO V_ID FROM DICTIONARY WHERE TEXT='��������'; 
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'����ͨ�з�',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'����ͨ�з�',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'ͣ����',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'ϴ����',2);
     COMMIT;
     
     --��������
     SELECT ID INTO V_ID FROM DICTIONARY WHERE TEXT='��������'; 
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'��ǿ��',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'��ҵ��',2);
     COMMIT;
     
     --ְ��
     SELECT ID INTO V_ID FROM DICTIONARY WHERE TEXT='ְ��'; 
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'�ܾ���',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'����',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'ְԱ',2);
     COMMIT;
     
     --��������
     SELECT ID INTO V_ID FROM DICTIONARY WHERE TEXT='��������'; 
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'A1',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'A2',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'B1',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'C1',2);
     COMMIT;
     
     --���ϱ�����
     SELECT ID INTO V_ID FROM DICTIONARY WHERE TEXT='���ϱ��'; 
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'92#',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'95#',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'93#',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'97#',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'98#',2);
     COMMIT;
     
     --����״̬
     /*SELECT ID INTO V_ID FROM DICTIONARY WHERE TEXT='����״̬'; 
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'����',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'����',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'ά��',2);
     COMMIT;
     INSERT INTO DICTIONARY(ID,PID,TEXT,LEV)
     VALUES(SEQ_DICTIONARY_ID.NEXTVAL,V_ID,'����',2);
     COMMIT;*/
     
     
     --�û�ְ���Ÿ���
     SELECT ID INTO V1 FROM DICTIONARY WHERE TEXT='ְԱ';
     SELECT ID INTO V2 FROM DICTIONARY WHERE TEXT='������';
     UPDATE Q_USERS SET POST_ID=V1,DEPT_ID=V2;
     COMMIT;
     
     --��ʻԱ�����Լ�׼�ݳ��͸���
     SELECT ID INTO V1 FROM DICTIONARY WHERE TEXT='���ڰ�';
     SELECT ID INTO V2 FROM DICTIONARY WHERE TEXT='A1';
     UPDATE DRIVER SET DEPT_ID=V1,DRIVER_TYPE=V2;
     COMMIT;
     
     --������λ���͸���
     SELECT ID INTO V1 FROM DICTIONARY WHERE TEXT='����վ';
     SELECT ID INTO V2 FROM CURRENT_UNIT WHERE UNIT_NAME='�ӳ����ƴ���������վ';
     UPDATE CURRENT_UNIT SET UNIT_TYPE=V1 WHERE ID=V2;
     COMMIT;
     SELECT ID INTO V2 FROM CURRENT_UNIT WHERE UNIT_NAME='�ӳ�����̫��·����վ';
     UPDATE CURRENT_UNIT SET UNIT_TYPE=V1 WHERE ID=V2;
     COMMIT;
     
     SELECT ID INTO V1 FROM DICTIONARY WHERE TEXT='4S�̼�';
     SELECT ID INTO V2 FROM CURRENT_UNIT WHERE UNIT_NAME='�㱾����4S��';
     UPDATE CURRENT_UNIT SET UNIT_TYPE=V1 WHERE ID=V2;
     COMMIT;
     SELECT ID INTO V2 FROM CURRENT_UNIT WHERE UNIT_NAME='��屴���4S��';
     UPDATE CURRENT_UNIT SET UNIT_TYPE=V1 WHERE ID=V2;
     COMMIT;
     SELECT ID INTO V2 FROM CURRENT_UNIT WHERE UNIT_NAME='���°µ�4S��';
     UPDATE CURRENT_UNIT SET UNIT_TYPE=V1 WHERE ID=V2;
     COMMIT;
     
     SELECT ID INTO V1 FROM DICTIONARY WHERE TEXT='������';
     SELECT ID INTO V2 FROM CURRENT_UNIT WHERE UNIT_NAME='����������';
     UPDATE CURRENT_UNIT SET UNIT_TYPE=V1 WHERE ID=V2;
     COMMIT;
     
     SELECT ID INTO V1 FROM DICTIONARY WHERE TEXT='���չ�˾';
     SELECT ID INTO V2 FROM CURRENT_UNIT WHERE UNIT_NAME='ƽ������';
     UPDATE CURRENT_UNIT SET UNIT_TYPE=V1 WHERE ID=V2;
     COMMIT;
     
     SELECT ID INTO V3 FROM DICTIONARY WHERE TEXT='��λ����';
     SELECT ID INTO V1 FROM DICTIONARY WHERE PID=V3 AND TEXT='����';
     SELECT ID INTO V2 FROM CURRENT_UNIT WHERE UNIT_NAME='��֯�Ǹ����շ�վ';
     UPDATE CURRENT_UNIT SET UNIT_TYPE=V1 WHERE ID=V2;
     COMMIT;
     
     --������Ϣ����
     SELECT ID INTO V_ID FROM CAR WHERE CAR_NO='��A88888';
     SELECT ID INTO V1 FROM DICTIONARY WHERE TEXT='����';
     SELECT ID INTO V2 FROM DICTIONARY WHERE TEXT='������';
     --SELECT ID INTO V3 FROM DICTIONARY WHERE TEXT='��ɫ';
     SELECT ID INTO V4 FROM CURRENT_UNIT WHERE UNIT_NAME='��屴���4S��';
     SELECT ID INTO V5 FROM DICTIONARY WHERE TEXT='���ڰ�';
     UPDATE CAR 
        SET CAR_BRAND=V1,CAR_MODEL=V2,SUP_ID=V4,DEPT_ID=V5 
      WHERE ID=V_ID;    
     COMMIT;
     
     SELECT ID INTO V_ID FROM CAR WHERE CAR_NO='��A66666';
     SELECT ID INTO V1 FROM DICTIONARY WHERE TEXT='�µ�';
     SELECT ID INTO V2 FROM DICTIONARY WHERE TEXT='A6L';
     --SELECT ID INTO V3 FROM DICTIONARY WHERE TEXT='��ɫ';
     SELECT ID INTO V4 FROM CURRENT_UNIT WHERE UNIT_NAME='���°µ�4S��';
     SELECT ID INTO V5 FROM DICTIONARY WHERE TEXT='���ڰ�';
     UPDATE CAR 
        SET CAR_BRAND=V1,CAR_MODEL=V2,SUP_ID=V4,DEPT_ID=V5 
      WHERE ID=V_ID;
     COMMIT;
     
     SELECT ID INTO V_ID FROM CAR WHERE CAR_NO='��A00001';
     SELECT ID INTO V1 FROM DICTIONARY WHERE TEXT='�µ�';
     SELECT ID INTO V2 FROM DICTIONARY WHERE TEXT='A8';
     --SELECT ID INTO V3 FROM DICTIONARY WHERE TEXT='��ɫ';
     SELECT ID INTO V4 FROM CURRENT_UNIT WHERE UNIT_NAME='���°µ�4S��';
     SELECT ID INTO V5 FROM DICTIONARY WHERE TEXT='���ڰ�';
     UPDATE CAR 
        SET CAR_BRAND=V1,CAR_MODEL=V2,SUP_ID=V4,DEPT_ID=V5 
      WHERE ID=V_ID;
     COMMIT;
     
     
     
     
END;


