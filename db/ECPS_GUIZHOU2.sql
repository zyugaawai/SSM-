----------------------------------------------------
-- Export file for user ECPS_GUIZHOU              --
-- Created by Administrator on 2013-7-5, 16:00:23 --
----------------------------------------------------
--地址表（新增)
create table eb_area(
       area_id  NUMBER(11) not null,
       parent_id  NUMBER(11) not null,
       area_name  varchar2(1000),
       area_level NUMBER(1)
)
create sequence seqareaid  start with 1000;     
insert into eb_area  values(seqareaid.nextval,0,'吉林省',1);
insert into eb_area  values(seqareaid.nextval,0,'广西省',1);
insert into eb_area  values(seqareaid.nextval,1001,'长春市',2);
insert into eb_area  values(seqareaid.nextval,1001,'吉林市',2);
insert into eb_area  values(seqareaid.nextval,1003,'农安县',3);

select * from eb_area;










spool ECPS_GUIZHOU2.log

prompt
prompt Creating table CRM_ITF_LOG
prompt ==========================
prompt
create table CRM_ITF_LOG
(
  LOG_ID          NUMBER(11) not null,
  INTERFACE_NAME  VARCHAR2(50),
  PARAM_INPUT     VARCHAR2(2000),
  PARAM_OUTPUT    VARCHAR2(2000),
  START_TIME      TIMESTAMP(6),
  END_TIME        TIMESTAMP(6),
  START_TIME_LONG NUMBER(20),
  END_TIME_LONG   NUMBER(20),
  COST_TIME       NUMBER(20),
  NOTE_INFO       VARCHAR2(2000),
  PROCESS_INFO    VARCHAR2(2000)
)
;
comment on column CRM_ITF_LOG.LOG_ID
  is '��־����';
comment on column CRM_ITF_LOG.INTERFACE_NAME
  is '�ӿ����';
comment on column CRM_ITF_LOG.PARAM_INPUT
  is '�������';
comment on column CRM_ITF_LOG.PARAM_OUTPUT
  is '�������';
comment on column CRM_ITF_LOG.START_TIME
  is '�ӿڿ�ʼִ��ʱ��';
comment on column CRM_ITF_LOG.END_TIME
  is '�ӿڽ���ִ��ʱ��';
comment on column CRM_ITF_LOG.START_TIME_LONG
  is '�ӿڿ�ʼִ��ʱ��ms��ʽ';
comment on column CRM_ITF_LOG.END_TIME_LONG
  is '�ӿڽ���ִ��ʱ��ms��ʽ';
comment on column CRM_ITF_LOG.COST_TIME
  is '�ӿ�ִ�л���ʱ��ms��ʽ';
comment on column CRM_ITF_LOG.NOTE_INFO
  is '��־��Ϣ����������־';
comment on column CRM_ITF_LOG.PROCESS_INFO
  is '�ӿڴ��?��';
alter table CRM_ITF_LOG
  add constraint LOG_ID primary key (LOG_ID);

prompt
prompt Creating table EB_ADVERTISEMENT
prompt ===============================
prompt
create table EB_ADVERTISEMENT
(
  AD_ID           NUMBER(11) not null,
  AD_NAME         VARCHAR2(80),
  AD_DESCRIPTION  VARCHAR2(1000),
  AD_TYPE         NUMBER(1),
  AD_WORDS        VARCHAR2(1000),
  AD_IMG          VARCHAR2(500),
  AD_PICTURES     VARCHAR2(2000),
  AD_FLASH        VARCHAR2(2000),
  AD_CAROUSELTIME NUMBER(5),
  AD_STATUS       NUMBER(1),
  AD_LINK         VARCHAR2(200),
  CREATOR         NUMBER(11),
  CREATE_TIME     TIMESTAMP(6),
  UPDATE_TIME     TIMESTAMP(6)
)
;
alter table EB_ADVERTISEMENT
  add constraint PK_EB_ADVERTISEMENT primary key (AD_ID);

prompt
prompt Creating table EB_AD_LOCATION
prompt =============================
prompt
create table EB_AD_LOCATION
(
  LOCATION_ID           NUMBER(11) not null,
  LOCATION_NAME         VARCHAR2(80),
  LOCATION_DESCRIPTIONS VARCHAR2(1000),
  LOCATION_WIDTH        NUMBER(5),
  LOCATION_HIGH         NUMBER(5),
  LOCATION_CODE         VARCHAR2(3000),
  CREATOR               NUMBER(11),
  CREATE_TIME           TIMESTAMP(6),
  UPDATE_TIME           TIMESTAMP(6)
)
;
alter table EB_AD_LOCATION
  add constraint PK_EB_AD_LOCATION primary key (LOCATION_ID);

prompt
prompt Creating table EB_AD_LOCATION_LINK
prompt ==================================
prompt
create table EB_AD_LOCATION_LINK
(
  AD_ID       NUMBER(11) not null,
  LOCATION_ID NUMBER(11) not null,
  STATUS      NUMBER(1)
)
;
alter table EB_AD_LOCATION_LINK
  add constraint PK_EB_AD_LOCATION_LINK primary key (AD_ID, LOCATION_ID);

prompt
prompt Creating table EB_ATT_CONFIG
prompt ============================
prompt
create table EB_ATT_CONFIG
(
  ATT_ID                  NUMBER(1) not null,
  ATT_SIZE                NUMBER(10),
  ATT_TYPE                VARCHAR2(200),
  ATT_MARK_PIC_MODE       NUMBER(1),
  ATT_MARK_CHAR_MODE      NUMBER(1),
  ATT_MARK_PIC_PATH       VARCHAR2(100),
  ATT_MARK_PIC_QUALITY    NUMBER(10),
  ATT_MARK_PIC_ALPHA      NUMBER(10),
  ATT_MARK_PIC_SIZE_WIDTH NUMBER(10),
  ATT_MARK_PIC_SIZE_HEIGH NUMBER(10),
  ATT_MARK_CHAR_CONTENT   VARCHAR2(20),
  ATT_MARK_CHAR_SIZE      NUMBER(10),
  ATT_MARK_CHAR_COLOR     VARCHAR2(10),
  ATT_MARK_POSITION       NUMBER(2),
  ATT_CUT_PIC_MIN_WIDTH   NUMBER(10),
  ATT_CUT_PIC_MIN_HEIGH   NUMBER(10)
)
;
comment on table EB_ATT_CONFIG
  is '�������ñ?Դ��PMS v4';
comment on column EB_ATT_CONFIG.ATT_ID
  is '���';
comment on column EB_ATT_CONFIG.ATT_SIZE
  is '�����̨�ϴ�������С';
comment on column EB_ATT_CONFIG.ATT_TYPE
  is '�����̨�ϴ���������';
comment on column EB_ATT_CONFIG.ATT_MARK_PIC_MODE
  is '�Ƿ���ͼƬˮӡ';
comment on column EB_ATT_CONFIG.ATT_MARK_CHAR_MODE
  is '�Ƿ�������ˮӡ';
comment on column EB_ATT_CONFIG.ATT_MARK_PIC_PATH
  is 'ͼƬ·��';
comment on column EB_ATT_CONFIG.ATT_MARK_PIC_QUALITY
  is 'ͼƬ����';
comment on column EB_ATT_CONFIG.ATT_MARK_PIC_ALPHA
  is 'ˮӡ͸����';
comment on column EB_ATT_CONFIG.ATT_MARK_PIC_SIZE_WIDTH
  is 'ͼƬ�ߴ���ƣ���';
comment on column EB_ATT_CONFIG.ATT_MARK_PIC_SIZE_HEIGH
  is 'ͼƬ�ߴ���ƣ���';
comment on column EB_ATT_CONFIG.ATT_MARK_CHAR_CONTENT
  is '��������';
comment on column EB_ATT_CONFIG.ATT_MARK_CHAR_SIZE
  is '���ִ�С';
comment on column EB_ATT_CONFIG.ATT_MARK_CHAR_COLOR
  is '������ɫ';
comment on column EB_ATT_CONFIG.ATT_MARK_POSITION
  is 'ˮӡλ��';
comment on column EB_ATT_CONFIG.ATT_CUT_PIC_MIN_WIDTH
  is 'ͼƬ��С�ü���С����';
comment on column EB_ATT_CONFIG.ATT_CUT_PIC_MIN_HEIGH
  is 'ͼƬ��С�ü���С����';
alter table EB_ATT_CONFIG
  add constraint PK_EB_ATTACHMENT_CONFIG primary key (ATT_ID);

prompt
prompt Creating table EB_BACKLANDLOG
prompt =============================
prompt
create table EB_BACKLANDLOG
(
  LANDLOG_ID         NUMBER(11) not null,
  LANDLOG_USER_NAME  VARCHAR2(40),
  LANDLOG_TIME       TIMESTAMP(6),
  LANDLOG_IP_ADDRESS VARCHAR2(50)
)
;
comment on table EB_BACKLANDLOG
  is '��¼��־��';
comment on column EB_BACKLANDLOG.LANDLOG_ID
  is '���';
comment on column EB_BACKLANDLOG.LANDLOG_USER_NAME
  is '�û���';
comment on column EB_BACKLANDLOG.LANDLOG_TIME
  is '��¼ʱ��';
comment on column EB_BACKLANDLOG.LANDLOG_IP_ADDRESS
  is 'IP��ַ';
alter table EB_BACKLANDLOG
  add constraint PK_EB_BACKLANDLOG primary key (LANDLOG_ID);

prompt
prompt Creating table EB_BRAND
prompt =======================
prompt
create table EB_BRAND
(
  BRAND_ID   NUMBER(11) not null,
  BRAND_NAME VARCHAR2(80) not null,
  BRAND_DESC VARCHAR2(1200),
  IMGS       VARCHAR2(100),
  WEBSITE    VARCHAR2(240),
  BRAND_SORT NUMBER(5)
)
;
comment on table EB_BRAND
  is 'Ʒ��';
comment on column EB_BRAND.BRAND_ID
  is 'Ʒ������';
comment on column EB_BRAND.BRAND_NAME
  is 'Ʒ����ƣ�һ��Ϊ���ֶ���ǰ̨��ʾ��������ƣ�Ҳ�ɺ���Ӣ�Ļ�����';
comment on column EB_BRAND.BRAND_DESC
  is 'Ʒ������';
comment on column EB_BRAND.IMGS
  is 'Ʒ��ͼ�꣺�洢ͼ���ַ';
comment on column EB_BRAND.WEBSITE
  is 'Ʒ����ַ';
comment on column EB_BRAND.BRAND_SORT
  is 'ǰ̨��ʾ����';
alter table EB_BRAND
  add constraint PK_EB_BRAND primary key (BRAND_ID);

prompt
prompt Creating table EB_BUSINESS_SCOPE
prompt ================================
prompt
create table EB_BUSINESS_SCOPE
(
  BUSINESS_SCOPE_ID   NUMBER(3) not null,
  BUSINESS_SCOPE_NAME VARCHAR2(32) not null,
  IS_ENABLED          NUMBER(1) default 0
)
;
comment on table EB_BUSINESS_SCOPE
  is '��Ӫ��Χ��';
comment on column EB_BUSINESS_SCOPE.BUSINESS_SCOPE_ID
  is '��Ӫ��Χ����';
comment on column EB_BUSINESS_SCOPE.BUSINESS_SCOPE_NAME
  is '��Ӫ��Χ���';
comment on column EB_BUSINESS_SCOPE.IS_ENABLED
  is '0-δ���ã�1-����';
alter table EB_BUSINESS_SCOPE
  add constraint PK_EB_BUSINESS_SCOPE primary key (BUSINESS_SCOPE_ID);

prompt
prompt Creating table EB_CART_SKU
prompt ==========================
prompt
create table EB_CART_SKU
(
  CART_SKU_ID      NUMBER(11) not null,
  PTL_USER_ID      NUMBER(11),
  ITEM_ID          NUMBER(11),
  ITEM_NAME        VARCHAR2(400),
  SKU_ID           NUMBER(11),
  SKU              VARCHAR2(80),
  SKU_NAME         VARCHAR2(500),
  SKU_SPEC         VARCHAR2(1000),
  MARKET_PRICE     NUMBER(20,2),
  OFFER_GROUP_ID   NUMBER(11),
  OFFER_GROUP_NAME VARCHAR2(200),
  OFFER_TYPE       NUMBER(2),
  SHORT_NAME       VARCHAR2(80),
  OFFER_NAME       VARCHAR2(800),
  SHORT_NAME2      VARCHAR2(50),
  PRICE            NUMBER(20,2),
  QUANTITY         NUMBER(5),
  ITEM_NO          VARCHAR2(120)
)
;
comment on table EB_CART_SKU
  is '���ﳵ��SKU';
comment on column EB_CART_SKU.CART_SKU_ID
  is '���ﳵ��SKU����';
comment on column EB_CART_SKU.PTL_USER_ID
  is 'ǰ̨�û�����';
comment on column EB_CART_SKU.ITEM_ID
  is '��Ʒ����';
comment on column EB_CART_SKU.ITEM_NAME
  is '��Ʒ���';
comment on column EB_CART_SKU.SKU
  is '����';
comment on column EB_CART_SKU.SKU_NAME
  is 'SKU���';
comment on column EB_CART_SKU.SKU_SPEC
  is '���1�����2�����3���������N����ʽ�μ������ĵ�';
comment on column EB_CART_SKU.MARKET_PRICE
  is '(�Էֱ�Ϊ��λ)�г��ۣ����м۸���ص��ֶ��޶�Ϊ9λ��Ч�������ڣ���1234567.89���൱��ǧ��Ԫ���ڣ�����ǰ���û���ʾʱ��С����Զ����2λ��������۸������ʾΪ.00����С��۸����2λС����ֱ�ӽص�2λС���ұߵ�С�����������룩����С��Ϊ1λ����1Ԫ9�ǣ�����ʾ1.90';
comment on column EB_CART_SKU.OFFER_GROUP_NAME
  is '����';
comment on column EB_CART_SKU.OFFER_TYPE
  is '����ͣ�1����������2���Żݹ���3��������';
comment on column EB_CART_SKU.SHORT_NAME
  is '���ơ�����ĸ��?��A1�е�A';
comment on column EB_CART_SKU.OFFER_NAME
  is '����μ��';
comment on column EB_CART_SKU.SHORT_NAME2
  is '��������ֱ�ţ���A1�е�1';
comment on column EB_CART_SKU.PRICE
  is '(�Էֱ�Ϊ��λ)����ʱ�۸�Ԥ�滰�ѡ�';
alter table EB_CART_SKU
  add constraint PK_EB_CART_SKU primary key (CART_SKU_ID);

prompt
prompt Creating table EB_CAT
prompt =====================
prompt
create table EB_CAT
(
  CAT_ID    NUMBER(11) not null,
  CAT_NAME  VARCHAR2(80) not null,
  CAT_DESC  VARCHAR2(80),
  PARENT_ID NUMBER(11) default 0,
  CAT_SORT  NUMBER(5),
  KEYWORDS  VARCHAR2(80),
  PATH      VARCHAR2(200),
  MARK      VARCHAR2(80),
  ISDISPLAY NUMBER(5),
  FULL_PATH VARCHAR2(200),
  CAT_TYPE  NUMBER(5)
)
;
comment on table EB_CAT
  is '��Ʒ��Ŀ��
1. ����һ��ֻ֧��������Ʒ�����ֻ�ͺſ���������Ϊһ�ֹ������õ�����������Ʒ�ϡ����ڻ�����������Ʒ���绰�Ѱ��ʷѰ�
';
comment on column EB_CAT.CAT_ID
  is '��Ŀ������Ʒ���?����¼�Լ���������Ʒ���ࣨ�����������ֻ��Ǻſ���������ͨ������������Ŀ��ȷ��������˵��ϵͳ����Ŀ���ʼ�����ֶ�����Ŀ��һ�����ֻ�CAT_ID����1������һ���Ǻſ���CAT_ID����2����ϵͳ��Ҫ�����Ʒ��������Ŀ��ID�ţ����жϸ���Ʒ���ֻ��Ǻſ���ע�⣬��Ʒ��Ŀ���CAT_ID��3��99��Ԥ����ϵͳ�����Ķ�����Ŀ�ģ�������Ŀ����Ķ�����ĿCAT_ID��100��ʼ��ţ���Ҫ�޸�ORACLE��SEQUENCE�����༭��Ʒʱ�����ֻ���Ŀ�е�����ӵ���Ʒ�������Ը�ĵ��ſ���Ŀ�У���֮��Ȼ��';
comment on column EB_CAT.CAT_NAME
  is '��Ŀ���';
comment on column EB_CAT.CAT_DESC
  is '��Ŀ����';
comment on column EB_CAT.PARENT_ID
  is '����ĿCAT_ID��0��ʾ������Ŀ��û�и���Ŀ��';
comment on column EB_CAT.CAT_SORT
  is 'ǰ̨��ʾ����';
comment on column EB_CAT.KEYWORDS
  is '�ؼ��';
comment on column EB_CAT.PATH
  is '��̬������·��';
comment on column EB_CAT.MARK
  is '�����ʶ���÷����Ψһ��ʶ�����ڷ���·����ģ���ʶ�����������ǰ̨��̬ҳ�棬�����ֻ����ı�ʶΪ"SHOUJI",���ó�HTTP://127.0.0.1/SHOUJI';
comment on column EB_CAT.ISDISPLAY
  is '�Ƿ�ǰ̨��ʾ';
comment on column EB_CAT.FULL_PATH
  is '��̬�����м����ȫ·�������ֻ������FULL_PATH��"/1/"';
comment on column EB_CAT.CAT_TYPE
  is '0�������ࣻ1��ʵ�壻2���ſ���3��������Ʒ';
alter table EB_CAT
  add constraint PK_EB_CAT primary key (CAT_ID);

prompt
prompt Creating table EB_CATBRAND
prompt ==========================
prompt
create table EB_CATBRAND
(
  CAT_ID   NUMBER(11) not null,
  BRAND_ID NUMBER(11) not null
)
;
alter table EB_CATBRAND
  add constraint PK_EB_CATBRAND primary key (CAT_ID, BRAND_ID);

prompt
prompt Creating table EB_CITY_AREA
prompt ===========================
prompt
create table EB_CITY_AREA
(
  AREA_ID   NUMBER(11) not null,
  AREA_NAME VARCHAR2(50),
  AREA_CODE VARCHAR2(50)
)
;
comment on column EB_CITY_AREA.AREA_NAME
  is '�������';
comment on column EB_CITY_AREA.AREA_CODE
  is '�������';
alter table EB_CITY_AREA
  add constraint PK_EB_CITY_AREA primary key (AREA_ID);

prompt
prompt Creating table EB_CITY_GROUPON
prompt ==============================
prompt
create table EB_CITY_GROUPON
(
  SERIAL_NO  NUMBER(11) not null,
  AREA_ID    NUMBER(11),
  GROUPON_ID NUMBER(11)
)
;
alter table EB_CITY_GROUPON
  add constraint PK_EB_CITY_GROUPON primary key (SERIAL_NO);

prompt
prompt Creating table EB_CONFIG_FTP
prompt ============================
prompt
create table EB_CONFIG_FTP
(
  SERIAL_NO    NUMBER(11) not null,
  PURPOSE      NUMBER(3),
  FTP_HOST     VARCHAR2(100),
  FTP_PORT     NUMBER(7),
  FTP_USERNAME VARCHAR2(100),
  FTP_PASSWORD VARCHAR2(100),
  BASE_DIR     VARCHAR2(100),
  AUTO_START   NUMBER(1)
)
;
comment on table EB_CONFIG_FTP
  is '1.����֮���ļ�ͬ����ftp��';
comment on column EB_CONFIG_FTP.SERIAL_NO
  is '���кţ�����';
comment on column EB_CONFIG_FTP.PURPOSE
  is '��;��1-��̬��֮��ͬ���ļ���Ŀ��ftp��';
comment on column EB_CONFIG_FTP.FTP_HOST
  is 'ftp�����ַ';
comment on column EB_CONFIG_FTP.FTP_PORT
  is 'ftp����˿�';
comment on column EB_CONFIG_FTP.FTP_USERNAME
  is 'ftp�û���';
comment on column EB_CONFIG_FTP.FTP_PASSWORD
  is 'ftp����';
comment on column EB_CONFIG_FTP.BASE_DIR
  is 'FTP��Ŀ¼';
comment on column EB_CONFIG_FTP.AUTO_START
  is '�Ƿ��Զ���ʼ��0-���Զ���ʼ��1-�Զ���ʼ';
alter table EB_CONFIG_FTP
  add constraint PK_EB_CONFIG_FTP primary key (SERIAL_NO);

prompt
prompt Creating table EB_CONSOLE_LOG
prompt =============================
prompt
create table EB_CONSOLE_LOG
(
  CONSOLE_LOG_ID NUMBER(11) not null,
  ENTITY_NAME    VARCHAR2(50),
  ENTITY_ID      NUMBER(11),
  USER_ID        NUMBER(11),
  OP_TYPE        VARCHAR2(50),
  OP_TIME        TIMESTAMP(6),
  NOTES          VARCHAR2(200),
  TABLE_NAME     VARCHAR2(100)
)
;
comment on table EB_CONSOLE_LOG
  is '��̨������־';
comment on column EB_CONSOLE_LOG.CONSOLE_LOG_ID
  is '��̨������־����';
comment on column EB_CONSOLE_LOG.ENTITY_NAME
  is '����ʵ�����ƣ���ݿ����������֣�';
comment on column EB_CONSOLE_LOG.ENTITY_ID
  is '����ʵ�����ݿ��¼����';
comment on column EB_CONSOLE_LOG.USER_ID
  is '������ID';
comment on column EB_CONSOLE_LOG.OP_TYPE
  is '��������';
comment on column EB_CONSOLE_LOG.OP_TIME
  is '����ʱ��';
comment on column EB_CONSOLE_LOG.NOTES
  is '��ע';
comment on column EB_CONSOLE_LOG.TABLE_NAME
  is '��������ݿ����';
alter table EB_CONSOLE_LOG
  add constraint PK_EB_CONSOLE_LOG primary key (CONSOLE_LOG_ID);

prompt
prompt Creating table EB_CONSTR
prompt ========================
prompt
create table EB_CONSTR
(
  CONSTR_ID      NUMBER(11) not null,
  OFFER_GROUP_ID NUMBER(11),
  CONSTR_NAME    VARCHAR2(50)
)
;
comment on table EB_CONSTR
  is 'Լ������(����Ҫ��)����������ʲô��Ŀͻ����ܲμӴ�����
����Ʒ�ƣ������ѡ������Ĭ��ȫѡ��1��ȫ��ͨ��2�����еش�3��������';
comment on column EB_CONSTR.CONSTR_ID
  is 'Լ����������';
comment on column EB_CONSTR.CONSTR_NAME
  is 'Լ��������ƣ�1��ȫ��ͨ��2�������У�3�����еش����ֿ����б仯��';
alter table EB_CONSTR
  add constraint PK_EB_CONSTR primary key (CONSTR_ID);

prompt
prompt Creating table EB_CUSTOMER_SERVICES
prompt ===================================
prompt
create table EB_CUSTOMER_SERVICES
(
  CS_ID      NUMBER(11) not null,
  AREA_ID    NUMBER(11),
  REGION_ID  NUMBER(11),
  CS_CODE    VARCHAR2(200),
  CS_NAME    VARCHAR2(200),
  CS_ADDRESS VARCHAR2(1000)
)
;
alter table EB_CUSTOMER_SERVICES
  add constraint PK_EB_CUSTOMER_SERVICES primary key (CS_ID);

prompt
prompt Creating table EB_DISTRI
prompt ========================
prompt
create table EB_DISTRI
(
  DISTRI_ID      NUMBER(11) not null,
  USER_ID        NUMBER(11),
  DISTRI_NAME    VARCHAR2(80),
  FKA            VARCHAR2(80),
  LEGAL_REP      VARCHAR2(80),
  REG_CAP        VARCHAR2(40),
  CORP_TYPE      NUMBER(2),
  BIZ_SCOPE      VARCHAR2(400),
  LICENSE_NO     VARCHAR2(120),
  ESTABLISH_DATE TIMESTAMP(6),
  CONTACT        VARCHAR2(80),
  MOBILE         VARCHAR2(50),
  FIXED_PHONE    VARCHAR2(80),
  FAX            VARCHAR2(80),
  EMAIL          VARCHAR2(120),
  WEBSITE        VARCHAR2(120),
  ADDRESS        VARCHAR2(80),
  ZIP            VARCHAR2(40),
  BANK_NAME      VARCHAR2(40),
  BANK_NO        VARCHAR2(60),
  BANK_ACCOUNT   VARCHAR2(80),
  TAX_NO         VARCHAR2(80),
  DISTRI_AREA    VARCHAR2(400),
  NOT_DELIVERY   VARCHAR2(800),
  BRANCH_NUM     NUMBER(10),
  EMPLOYEE_NUM   NUMBER(10),
  CHARGE_STD     VARCHAR2(400),
  ATTACHMENT     VARCHAR2(200),
  IS_RECYCLED    NUMBER(1) default 0,
  IS_ACTIVE      NUMBER(1),
  FEATURED_SVR   VARCHAR2(500),
  CREATED_TIME   TIMESTAMP(6)
)
;
comment on table EB_DISTRI
  is '������';
comment on column EB_DISTRI.USER_ID
  is '��̨�û�����';
comment on column EB_DISTRI.DISTRI_NAME
  is '���������';
comment on column EB_DISTRI.FKA
  is '������������Formerly Known As';
comment on column EB_DISTRI.LEGAL_REP
  is '���˴��';
comment on column EB_DISTRI.REG_CAP
  is 'ע���ʱ������ı�ʾ10���ַ�����';
comment on column EB_DISTRI.CORP_TYPE
  is '��ҵ���ͣ�1������ҵ, 2������ҵ, 3˽Ӫ��ҵ, 4��Ӫ��ҵ, 5�������ι�˾, 6�ɷ����޹�˾, 7�ɷݺ�����ҵ, 8������ҵ, 9�ۡ��ġ�̨��Ͷ����ҵ, 10 ����Ͷ����ҵ����; 6.�ɷ�����; 7.�ɷݺ���; 8.������ҵ��λ��������塢������ҵ��';
comment on column EB_DISTRI.BIZ_SCOPE
  is '��Ӫ��Χ';
comment on column EB_DISTRI.LICENSE_NO
  is 'Ӫҵִ�պ�';
comment on column EB_DISTRI.ESTABLISH_DATE
  is '��������';
comment on column EB_DISTRI.CONTACT
  is '��ϵ��';
comment on column EB_DISTRI.MOBILE
  is '�ƶ��绰��11λ����';
comment on column EB_DISTRI.FIXED_PHONE
  is '�̶��绰����';
comment on column EB_DISTRI.FAX
  is '�������';
comment on column EB_DISTRI.EMAIL
  is '�����ʼ�';
comment on column EB_DISTRI.WEBSITE
  is '��ַ';
comment on column EB_DISTRI.ADDRESS
  is '��ַ';
comment on column EB_DISTRI.ZIP
  is '�ʱ�';
comment on column EB_DISTRI.BANK_NAME
  is '��������';
comment on column EB_DISTRI.BANK_NO
  is '�������б��';
comment on column EB_DISTRI.BANK_ACCOUNT
  is '�����˺�';
comment on column EB_DISTRI.TAX_NO
  is '��˰��';
comment on column EB_DISTRI.DISTRI_AREA
  is '��������';
comment on column EB_DISTRI.NOT_DELIVERY
  is '�����ͻ�Ʒ';
comment on column EB_DISTRI.BRANCH_NUM
  is '����վ����';
comment on column EB_DISTRI.EMPLOYEE_NUM
  is '������Ա��';
comment on column EB_DISTRI.CHARGE_STD
  is '�ʷѱ�׼';
comment on column EB_DISTRI.ATTACHMENT
  is '�ϴ��ļ��洢λ�ã���ʽ��Word��pdf��zip��rar��ѹ����';
comment on column EB_DISTRI.IS_RECYCLED
  is '�Ƿ�������վ��0����1����';
comment on column EB_DISTRI.IS_ACTIVE
  is '�Ƿ����á�0����1����';
comment on column EB_DISTRI.FEATURED_SVR
  is '��ɫ����';
comment on column EB_DISTRI.CREATED_TIME
  is '��¼����ʱ��';
alter table EB_DISTRI
  add constraint PK_EB_DISTRI primary key (DISTRI_ID);

prompt
prompt Creating table EB_FEATURE
prompt =========================
prompt
create table EB_FEATURE
(
  FEATURE_ID    NUMBER(11) not null,
  CAT_ID        NUMBER(11),
  FEATURE_NAME  VARCHAR2(80) not null,
  IS_SPEC       NUMBER(1),
  IS_SELECT     NUMBER(1),
  IS_SHOW       NUMBER(1),
  SELECT_VALUES VARCHAR2(800),
  INPUT_TYPE    NUMBER(2),
  FEATURE_SORT  NUMBER(5)
)
;
comment on table EB_FEATURE
  is '��Ʒ����
Ԥ�õ��ֻ�����뽫Ԥ�ÿ�ѡֵ��������
1.      �ͺ�                   �ַ�
2.      ���                   �����б?Ԥ�ÿ�ѡֵ��ֱ�塢���ǡ����ǡ����
3.      ����ϵͳ                   �����б?Ԥ�ÿ�ѡֵ��Symbian��WindowsMobile��Android, iOS����������ϵͳ��������ϵͳ
4.      ������ʽ                   �����б?Ԥ�ÿ�ѡֵ�����ݴ��������败����ȫ���̡���׼����
5.      �ڴ�                   �ַ�
6.      ���濨              �ַ�
7.      ��Ļ�ֱ���              �ַ�
8.      ����ͷ              �ַ�
9.      ���ӷ�ʽ                   ��ѡ��Ԥ�ÿ�ѡֵ�� WIFI�����������⣬Ĭ�϶�����ѡ
10.   ����ߴ�                   �ַ�
11.   ����                   �ַ�     Ĭ����KGΪ��λ
12.   ����                   �ַ�

Ԥ�õ��ֻ����뽫Ԥ�ÿ�ѡֵ��������
1.      ��ɫ                   �����б?Ԥ�ÿ�ѡֵ����ɫ����ɫ
2.      �洢��              �����б?Ԥ�ÿ�ѡֵ��16G��32G
Ԥ�õĺſ�����
1. �Ŷ�
2. ������ɣ���ѡֵ��AAAA��ABCDE��AAA��ABCD��ABCABC��ABABAB��AABB
3. ������������ѡֵ����һ��8��������8������4����1314����520����00
';
comment on column EB_FEATURE.FEATURE_ID
  is '��Ʒ��������';
comment on column EB_FEATURE.FEATURE_NAME
  is '�������';
comment on column EB_FEATURE.IS_SPEC
  is '�Ƿ�Ϊ���0.Ϊ�� 1.Ϊ��';
comment on column EB_FEATURE.IS_SELECT
  is '�Ƿ�Ϊɸѡ��0Ϊ�� 1Ϊ��';
comment on column EB_FEATURE.IS_SHOW
  is '�Ƿ�ǰ̨��ʾ��0.Ϊ�� 1.Ϊ��';
comment on column EB_FEATURE.SELECT_VALUES
  is '���Կ�ѡֵ����Ӣ�Ķ��ŷָ�Ŀ�ѡֵ����ѡֵ�ﲻ���ж���';
comment on column EB_FEATURE.INPUT_TYPE
  is '¼�뷽ʽ��1.��״�˵���2.��ѡ��3.��ѡ��4.�ı���';
comment on column EB_FEATURE.FEATURE_SORT
  is 'ǰ̨��ʾ����';
alter table EB_FEATURE
  add constraint PK_EB_FEATURE primary key (FEATURE_ID);

prompt
prompt Creating table EB_GROUPON
prompt =========================
prompt
create table EB_GROUPON
(
  GROUPON_ID    NUMBER(11) not null,
  ACTIVITY_TYPE NUMBER(3),
  GROUPON_TITLE VARCHAR2(3000),
  GROUPON_IMG   VARCHAR2(600),
  GIFT_INFO     VARCHAR2(3000),
  GROUPON_ORDER NUMBER(10),
  NOTICE_ORDER  NUMBER(10),
  SALES         NUMBER(10),
  VIRTUAL_SALES NUMBER(10),
  START_TIME    TIMESTAMP(6),
  END_TIME      TIMESTAMP(6),
  IS_RECOMMEND  NUMBER(1),
  IS_DELETE     NUMBER(1)
)
;
comment on column EB_GROUPON.ACTIVITY_TYPE
  is '0-�ֻ��Ź�';
comment on column EB_GROUPON.IS_RECOMMEND
  is '0-���Ƽ���1-��ҳ�Ƽ���';
alter table EB_GROUPON
  add constraint PK_EB_GROUPON primary key (GROUPON_ID);

prompt
prompt Creating table EB_GROUPON_INFO
prompt ==============================
prompt
create table EB_GROUPON_INFO
(
  GROUPON_ID NUMBER(11) not null,
  INFO       CLOB
)
;
alter table EB_GROUPON_INFO
  add constraint PK_EB_GROUPON_INFO primary key (GROUPON_ID);

prompt
prompt Creating table EB_GROUPON_SKU
prompt =============================
prompt
create table EB_GROUPON_SKU
(
  GROUPON_ID      NUMBER(11),
  SKU_ID          NUMBER(11),
  GROUPON_PRICE   NUMBER(20,2),
  ORDER_NO        NUMBER(10),
  SKU_UPPER_LIMIT NUMBER(11)
)
;
comment on column EB_GROUPON_SKU.SKU_ID
  is '��С���۵�Ԫ����';
comment on column EB_GROUPON_SKU.SKU_UPPER_LIMIT
  is '�Ź�SKU��������';

prompt
prompt Creating table EB_ITEM
prompt ======================
prompt
create table EB_ITEM
(
  ITEM_ID                NUMBER(11) not null,
  ITEM_NAME              VARCHAR2(400) not null,
  ITEM_NO                VARCHAR2(120) not null,
  BRAND_ID               NUMBER(11),
  CAT_ID                 NUMBER(11) not null,
  TAG_IMG_ID             NUMBER(11),
  TAG_IMG                NUMBER(1),
  IS_NEW                 NUMBER(1),
  IS_GOOD                NUMBER(1),
  IS_HOT                 NUMBER(1),
  PROMOTION              VARCHAR2(200),
  AUDIT_STATUS           NUMBER(2),
  SHOW_STATUS            NUMBER(2),
  IMGS                   VARCHAR2(3000),
  KEYWORDS               VARCHAR2(120),
  PAGE_DESC              VARCHAR2(640),
  ITEM_RECYCLE           NUMBER(2) default 0,
  ON_SALE_TIME           TIMESTAMP(6),
  CHECK_TIME             TIMESTAMP(6),
  UPDATE_TIME            TIMESTAMP(6),
  UPDATE_USER_ID         NUMBER(11),
  CREATE_TIME            TIMESTAMP(6),
  CHECKER_USER_ID        NUMBER(11),
  FULL_PATH_DEPLOY       VARCHAR2(600),
  FULL_PATH_DEPLOY_OFFER VARCHAR2(600),
  ORIGINAL_ITEM_ID       NUMBER(11),
  LAST_STATUS            NUMBER(1),
  MERCHANT_ID            NUMBER(11),
  ITEM_SORT              NUMBER(10),
  SALES                  NUMBER(10),
  CREATE_USER_ID         NUMBER(11),
  SIM_LEVEL              NUMBER(1),
  GIFT_DESC              VARCHAR2(200),
  GIFT_IMG               VARCHAR2(600),
  GIFT_SHOW_TYPE         VARCHAR2(100),
  IMG_SIZE1              VARCHAR2(1000)
)
;
comment on table EB_ITEM
  is '��Ʒ�����ֻ�ͺſ���ͨ������Ŀ����Ԥ�õ��ֻ���Ŀ�ͺſ���Ŀ����֡�����ֻ���壬�����κ�ͨ�ŷ���Ͱ󶨵ķ��õĻ�������Ӫ�̲�����ʹ���ض��ֻ���ֻ�ɸ���û���������ѡ���򡣺ſ����ֳ�Ϊ�ƶ��绰SIM������11λ������ɣ����ײͰ󶨣���Ӫ��ͨ��ſ�ȷ�Ͽͻ���Ϣ����ͨ���ṩ�ƶ�ͨ�Ÿ��ַ���
TODO:';
comment on column EB_ITEM.ITEM_ID
  is '��Ʒ����';
comment on column EB_ITEM.ITEM_NAME
  is '��Ʒ��ơ��ſ����ţ��ĵ����������seo��ص�title�ֶΡ��ṩ�ظ������⹦��,�����?��������ظ�����Ʒ���������������ַ�';
comment on column EB_ITEM.ITEM_NO
  is '��Ʒ��ţ��Զ���ɣ������ظ��������ɺ󲻿��޸ġ���Ź���һ��Ŀ¼���֡�1��+7λ������������ʼ���   10000001��7λ�������ʱ�Զ���Ϊ8λ��
��Ÿ��EB_ITEM.CAT_TYPE��ã���ʵ����ƷΪ1��EB_ITEM.CAT_TYPE=1��
��ɾ��
--ʵ����ʼ��ţ�   10000001 ������ʼ��ţ�   20000001��
--ע�⣺��Ʒ�Ƿ�Ϊ�ֻ��ſ���������������Ŀ����֣�CAT_IDΪ1��Ϊ�ֻ�CAT_IDΪ2��Ϊ�ſ�����
';
comment on column EB_ITEM.BRAND_ID
  is '��ƷƷ�ƣ���״�˵�����ѡ����ʾ�����������Ʒ�ơ�';
comment on column EB_ITEM.CAT_ID
  is '��Ʒ���ࣺ��״�˵�����ѡ�������޸�';
comment on column EB_ITEM.TAG_IMG_ID
  is '��Ʒ��ǩͼƬid';
comment on column EB_ITEM.TAG_IMG
  is '�ѷ�����ʹ��ITEM_TAG_IMG_IDָ����ǩͼƬ��
��ǩͼƬ��1.����;2.�Ƽ�;3.�����ۡ��ɲ�ѡ��ѡ��������ǰ̨��ƷͼƬ�ϣ������ڴ���';
comment on column EB_ITEM.IS_NEW
  is '0��1�ǣ�Ĭ��1';
comment on column EB_ITEM.IS_GOOD
  is '0��1�ǣ�Ĭ��0';
comment on column EB_ITEM.IS_HOT
  is '0��1�ǣ�Ĭ��0';
comment on column EB_ITEM.PROMOTION
  is '���������ǰ̨��ʾ���ؼ������';
comment on column EB_ITEM.AUDIT_STATUS
  is 'ʵ����Ʒ���״̬(�ſ�û�����)��0������ˣ�1�����ͨ��2�����δͨ��';
comment on column EB_ITEM.SHOW_STATUS
  is '���¼�״̬��0.Ϊ�ϼ� 1.Ϊ�¼�';
comment on column EB_ITEM.IMGS
  is '�ϴ�ͼƬ�����5��ͼƬ�Ĵ洢��ַ���÷ָ���ֿ����������ϴ�ͼƬ���߱�ɾ������������ܣ����ֻ���ϴ�����ͼƬ��ͼƬ�ϴ��󹲱���5���ߴ磨ԭʼ�ߴ磬�������4���ߴ� 50x50 �� 100x100 �� 150x150��300x300�������ߴ��ṩǰ̨ҳ����á�
ÿ��ͼƬ�ϴ�֮���ͼƬ���������Ϊ���ϴ��û�ID+����ʱ�䣨��ȷ���룩+6λӢ�����������,  ���ͼƬ��ʽ����ڲ�ͬ���ļ��У�����δ����չ��
ÿ��ͼƬ��С��ѭ��ϵͳ���á��Ը����ϴ���С�����ơ�һ��Ĭ��ͼƬ��ʽ֧��jpg��gif��png(3����ʽ����ִ�Сд)����С������3MB��ˮӡ����һ�ڲ�������ͼƬ�ü�����һ�ڲ�����';
comment on column EB_ITEM.KEYWORDS
  is 'ҳ��ؼ��';
comment on column EB_ITEM.PAGE_DESC
  is 'ҳ���������ı���';
comment on column EB_ITEM.ITEM_RECYCLE
  is '�Ƿ�ɾ��0��δɾ��1���Ѿ�ɾ��Ĭ��ֵ��0';
comment on column EB_ITEM.ON_SALE_TIME
  is '�ϼ�ʱ��';
comment on column EB_ITEM.FULL_PATH_DEPLOY
  is 'δ�μӻ����Ʒ�ľ�̬��ҳ��ķ���·���������·����';
comment on column EB_ITEM.FULL_PATH_DEPLOY_OFFER
  is '�μӻ����Ʒ�ľ�̬��ҳ��ķ���·��';
comment on column EB_ITEM.LAST_STATUS
  is '0����ʷ��¼;1����';
comment on column EB_ITEM.SIM_LEVEL
  is '�������ȣ���ѡ��1.�������š�2.��ͨ���š�3.��ͨ��';
comment on column EB_ITEM.GIFT_DESC
  is '��Ʒ����';
comment on column EB_ITEM.GIFT_IMG
  is '��ƷͼƬ';
comment on column EB_ITEM.GIFT_SHOW_TYPE
  is '��Ʒ��ʾ����';
alter table EB_ITEM
  add constraint PK_EB_ITEM primary key (ITEM_ID);

prompt
prompt Creating table EB_ITEM_BUSINESS_SCOPE
prompt =====================================
prompt
create table EB_ITEM_BUSINESS_SCOPE
(
  BUSINESS_SCOPE_ID NUMBER(3) not null,
  ITEM_ID           NUMBER(11) not null
)
;
comment on column EB_ITEM_BUSINESS_SCOPE.BUSINESS_SCOPE_ID
  is '��Ӫ��Χ����';
comment on column EB_ITEM_BUSINESS_SCOPE.ITEM_ID
  is '��Ʒ����';
alter table EB_ITEM_BUSINESS_SCOPE
  add constraint EB_ITEM_BUSINESS_SCOPE primary key (BUSINESS_SCOPE_ID, ITEM_ID);

prompt
prompt Creating table EB_ITEM_CLOB
prompt ===========================
prompt
create table EB_ITEM_CLOB
(
  ITEM_ID      NUMBER(11) not null,
  ITEM_DESC    CLOB,
  PACKING_LIST CLOB
)
;
comment on column EB_ITEM_CLOB.ITEM_DESC
  is '��Ʒ���������ı��༭�����������������ַ���ת�壻���ַ�����';
comment on column EB_ITEM_CLOB.PACKING_LIST
  is '��װ�嵥';
alter table EB_ITEM_CLOB
  add constraint PK_EB_ITEM_CLOB primary key (ITEM_ID);

prompt
prompt Creating table EB_ITEM_TAG_IMG
prompt ==============================
prompt
create table EB_ITEM_TAG_IMG
(
  TAG_IMG_ID  NUMBER(11) not null,
  TAG_IMG_URL VARCHAR2(256)
)
;
comment on table EB_ITEM_TAG_IMG
  is '��Ʒ��ǩͼƬ';
comment on column EB_ITEM_TAG_IMG.TAG_IMG_URL
  is '��ǩͼURL';
alter table EB_ITEM_TAG_IMG
  add constraint PK_EB_ITEM_TAG_IMG primary key (TAG_IMG_ID);

prompt
prompt Creating table EB_JBPM_LOG
prompt ==========================
prompt
create table EB_JBPM_LOG
(
  DBID      NUMBER(19),
  ORDER_NUM VARCHAR2(80),
  OPER      VARCHAR2(100),
  OPER_TIME TIMESTAMP(6),
  OPER_USER VARCHAR2(100),
  NOTE      VARCHAR2(1000)
)
;
comment on table EB_JBPM_LOG
  is '��������־��';
comment on column EB_JBPM_LOG.DBID
  is '��������';
comment on column EB_JBPM_LOG.ORDER_NUM
  is '������';
comment on column EB_JBPM_LOG.OPER
  is '��������';
comment on column EB_JBPM_LOG.OPER_TIME
  is '����ʱ��';
comment on column EB_JBPM_LOG.OPER_USER
  is '������';
comment on column EB_JBPM_LOG.NOTE
  is '������ע';

prompt
prompt Creating table EB_KEYWORD
prompt =========================
prompt
create table EB_KEYWORD
(
  KEYWORD_ID      NUMBER(11) not null,
  KEYWORD_NAME    VARCHAR2(100),
  REPLACE_CONTENT VARCHAR2(255),
  STATUS          NUMBER(1),
  CREATE_TIME     TIMESTAMP(6),
  CREATOR         VARCHAR2(20),
  REPLACE_TYPE    NUMBER(1),
  EXTERNAL_LINK   VARCHAR2(300)
)
;
comment on table EB_KEYWORD
  is 'PMS�ؼ�ʱ�';
comment on column EB_KEYWORD.KEYWORD_ID
  is '�ؼ��ID';
comment on column EB_KEYWORD.KEYWORD_NAME
  is '�ؼ�����';
comment on column EB_KEYWORD.REPLACE_CONTENT
  is '�滻����';
comment on column EB_KEYWORD.STATUS
  is '״̬';
comment on column EB_KEYWORD.CREATE_TIME
  is '����ʱ��';
comment on column EB_KEYWORD.CREATOR
  is '������';
comment on column EB_KEYWORD.REPLACE_TYPE
  is '�滻����';
comment on column EB_KEYWORD.EXTERNAL_LINK
  is '�ⲿ����';
alter table EB_KEYWORD
  add constraint EB_KEYWORD_PK primary key (KEYWORD_ID);

prompt
prompt Creating table EB_MAIL
prompt ======================
prompt
create table EB_MAIL
(
  MAIL_ID      NUMBER(11) not null,
  SRC_ADDR     VARCHAR2(100),
  MAIL_SERVER  VARCHAR2(100),
  USERNAME     VARCHAR2(50),
  PASSWORD     VARCHAR2(50),
  MAIL_SUBJECT VARCHAR2(100),
  SEND_NAME    VARCHAR2(100)
)
;
comment on column EB_MAIL.MAIL_ID
  is '�ʼ�����������';
comment on column EB_MAIL.SRC_ADDR
  is 'Դ��ַ';
comment on column EB_MAIL.MAIL_SERVER
  is '�ʼ�������';
comment on column EB_MAIL.USERNAME
  is '�ʼ��������û���';
comment on column EB_MAIL.PASSWORD
  is '�ʼ�����������';
comment on column EB_MAIL.MAIL_SUBJECT
  is '�ʼ�����';
comment on column EB_MAIL.SEND_NAME
  is '������';
alter table EB_MAIL
  add constraint PK_EB_MAIL primary key (MAIL_ID);

prompt
prompt Creating table EB_MEMBER_CONFIG
prompt ===============================
prompt
create table EB_MEMBER_CONFIG
(
  MEMBER_ID         NUMBER(1) not null,
  MEMBER_OPTION     NUMBER(1),
  MEMBER_REG_OPTION NUMBER(1),
  MEMBER_NAME_MIN   NUMBER(10),
  MEMBER_PASS_MIN   NUMBER(10),
  MEMBER_RESERVE    VARCHAR2(10),
  MEMBER_NAME_MAX   NUMBER(10),
  MEMBER_PASS_MAX   NUMBER(10)
)
;
comment on table EB_MEMBER_CONFIG
  is 'PMS��Ա���ñ�';
comment on column EB_MEMBER_CONFIG.MEMBER_ID
  is '���';
comment on column EB_MEMBER_CONFIG.MEMBER_OPTION
  is '�Ƿ�����Ա����';
comment on column EB_MEMBER_CONFIG.MEMBER_REG_OPTION
  is '�Ƿ�����Աע�Ṧ��';
comment on column EB_MEMBER_CONFIG.MEMBER_NAME_MIN
  is 'ע���û�����С����';
comment on column EB_MEMBER_CONFIG.MEMBER_PASS_MIN
  is 'ע��������С����';
comment on column EB_MEMBER_CONFIG.MEMBER_RESERVE
  is '�û�������';
comment on column EB_MEMBER_CONFIG.MEMBER_NAME_MAX
  is 'ע���û�����󳤶�';
comment on column EB_MEMBER_CONFIG.MEMBER_PASS_MAX
  is 'ע��������С����';
alter table EB_MEMBER_CONFIG
  add constraint PK_EB_MEMBER_CONFIG primary key (MEMBER_ID);

prompt
prompt Creating table EB_MERCHANT_CAT
prompt ==============================
prompt
create table EB_MERCHANT_CAT
(
  ID          NUMBER(11),
  CAT_ID      NUMBER(11),
  CAT_NAME    VARCHAR2(80),
  MERCHANT_ID NUMBER(11)
)
;
comment on column EB_MERCHANT_CAT.CAT_ID
  is '��Ŀ������Ʒ���?����¼�Լ���������Ʒ���ࣨ�����������ֻ��Ǻſ���������ͨ������������Ŀ��ȷ��������˵��ϵͳ����Ŀ���ʼ�����ֶ�����Ŀ��һ�����ֻ�CAT_ID����1������һ���Ǻſ���CAT_ID����2����ϵͳ��Ҫ�����Ʒ��������Ŀ��ID�ţ����жϸ���Ʒ���ֻ��Ǻſ���ע�⣬��Ʒ��Ŀ���CAT_ID��3��99��Ԥ����ϵͳ�����Ķ�����Ŀ�ģ�������Ŀ����Ķ�����ĿCAT_ID��100��ʼ��ţ���Ҫ�޸�ORACLE��SEQUENCE�����༭��Ʒʱ�����ֻ���Ŀ�е�����ӵ���Ʒ�������Ը�ĵ��ſ���Ŀ�У���֮��Ȼ��';

prompt
prompt Creating table EB_MYFAV_SKU
prompt ===========================
prompt
create table EB_MYFAV_SKU
(
  MYFAV_SKU_ID     NUMBER(11) not null,
  PTL_USER_ID      NUMBER(11) not null,
  FAV_TIME         TIMESTAMP(6),
  MYFAV_TYPE       NUMBER(1),
  FAV_URL          VARCHAR2(500),
  ITEM_ID          NUMBER(11),
  ITEM_NAME        VARCHAR2(400),
  SKU_ID           NUMBER(11),
  SKU              VARCHAR2(80),
  SKU_NAME         VARCHAR2(500),
  SKU_SPEC         VARCHAR2(1000),
  MARKET_PRICE     NUMBER(20,2),
  OFFER_GROUP_ID   NUMBER(11),
  OFFER_GROUP_NAME VARCHAR2(200),
  OFFER_ID         NUMBER(11),
  OFFER_TYPE       NUMBER(2),
  SHORT_NAME       VARCHAR2(80),
  OFFER_NAME       VARCHAR2(800),
  SHORT_NAME2      VARCHAR2(50),
  PRICE            NUMBER(20,2),
  VALID_BEGIN      TIMESTAMP(6),
  VALID_END        TIMESTAMP(6),
  CONSTR_NAME      VARCHAR2(200)
)
;
comment on table EB_MYFAV_SKU
  is '�ҵ��ղ�';
comment on column EB_MYFAV_SKU.MYFAV_SKU_ID
  is '�ҵ��ղ�����';
comment on column EB_MYFAV_SKU.PTL_USER_ID
  is 'ǰ̨�û�ID';
comment on column EB_MYFAV_SKU.FAV_TIME
  is '�ղ�ʱ��';
comment on column EB_MYFAV_SKU.MYFAV_TYPE
  is '�ղ����͡�1��SKU��2������';
comment on column EB_MYFAV_SKU.FAV_URL
  is '�洢���·��';
comment on column EB_MYFAV_SKU.ITEM_ID
  is '��Ʒ����';
comment on column EB_MYFAV_SKU.ITEM_NAME
  is '��Ʒ���';
comment on column EB_MYFAV_SKU.SKU
  is '����';
comment on column EB_MYFAV_SKU.SKU_NAME
  is 'SKU���';
comment on column EB_MYFAV_SKU.SKU_SPEC
  is '���1�����2�����3���������N����ʽ�μ������ĵ�';
comment on column EB_MYFAV_SKU.MARKET_PRICE
  is '(�Էֱ�Ϊ��λ)�г��ۣ����м۸���ص��ֶ��޶�Ϊ9λ��Ч�������ڣ���1234567.89���൱��ǧ��Ԫ���ڣ�����ǰ���û���ʾʱ��С����Զ����2λ��������۸������ʾΪ.00����С��۸����2λС����ֱ�ӽص�2λС���ұߵ�С�����������룩����С��Ϊ1λ����1Ԫ9�ǣ�����ʾ1.90';
comment on column EB_MYFAV_SKU.OFFER_GROUP_ID
  is '����ID';
comment on column EB_MYFAV_SKU.OFFER_GROUP_NAME
  is '����';
comment on column EB_MYFAV_SKU.OFFER_ID
  is '�����ID';
comment on column EB_MYFAV_SKU.OFFER_TYPE
  is '����ͣ�1����������2���Żݹ���3��������';
comment on column EB_MYFAV_SKU.SHORT_NAME
  is '���ơ�����ĸ��?��A1�е�A';
comment on column EB_MYFAV_SKU.OFFER_NAME
  is '����μ��';
comment on column EB_MYFAV_SKU.SHORT_NAME2
  is '��������ֱ�ţ���A1�е�1';
comment on column EB_MYFAV_SKU.PRICE
  is '(�Էֱ�Ϊ��λ)����ʱ�۸�Ԥ�滰�ѡ�';
alter table EB_MYFAV_SKU
  add constraint PK_EB_MYFAV primary key (MYFAV_SKU_ID);

prompt
prompt Creating table EB_OFFER
prompt =======================
prompt
create table EB_OFFER
(
  OFFER_ID          NUMBER(11) not null,
  OFFER_GROUP_ID    NUMBER(11),
  OFFER_NAME        VARCHAR2(800),
  OFFER_NO          VARCHAR2(120),
  SHORT_NAME        VARCHAR2(50),
  OFFER_SORT        NUMBER(5),
  OFFER_TERM        NUMBER(2),
  COMMIT_MONTHLY    NUMBER(20,2),
  PREPAID           NUMBER(20,2),
  PERIOD            NUMBER(2),
  REFUND_MONTHLY    NUMBER(20,2),
  REFUND_1ST_MONTH  NUMBER(20,2),
  REFUND_LAST_MONTH NUMBER(20,2),
  NOTES             VARCHAR2(1000),
  CREATE_TIME       TIMESTAMP(6),
  UPDATE_TIME       TIMESTAMP(6),
  CREATE_USER_ID    NUMBER(11),
  UPDATE_USER_ID    NUMBER(11),
  ORIGINAL_OFFER_ID NUMBER(11),
  LAST_STATUS       NUMBER(1),
  MERCHANT_ID       NUMBER(11),
  VALID_BEGIN       TIMESTAMP(6),
  VALID_END         TIMESTAMP(6),
  COND_ID           VARCHAR2(20),
  SCHEME_TYPE       NUMBER(2)
)
;
comment on table EB_OFFER
  is '����Σ��ɸ�ݲ�ͬ�ĺſ�Ʒ�ƺͲ�ͬ�����ˮƽ��ϳɲ�ͬ�Ĵ������Σ��ͻ�Ԥ��һ����Ȼ��ѻ�ǩԼ��ŵʹ������ʱ�䣬�����ܵ��Żݹ���۸�Ĺ�����';
comment on column EB_OFFER.OFFER_ID
  is '��������';
comment on column EB_OFFER.OFFER_NAME
  is '����μ��';
comment on column EB_OFFER.OFFER_NO
  is '����α�ţ���ʼ��ţ� 50000001';
comment on column EB_OFFER.SHORT_NAME
  is '��������ֱ�ţ���A1�е�1';
comment on column EB_OFFER.OFFER_SORT
  is 'ǰ̨��ʾ����';
comment on column EB_OFFER.OFFER_TERM
  is 'ҵ��Э���ڣ�1��6���£�2��12���£�3��18���£�4��24����';
comment on column EB_OFFER.COMMIT_MONTHLY
  is '���Էֱ�Ϊ��λ���³�ŵ��ѽ�����0С��10000������';
comment on column EB_OFFER.PREPAID
  is '���Էֱ�Ϊ��λ��Ԥ�滰�ѽ�����0С��10000������';
comment on column EB_OFFER.PERIOD
  is '�����ڡ�1���������ʣ�2��6���£�3��12���£�4��18���£�5��24����';
comment on column EB_OFFER.REFUND_MONTHLY
  is '���Էֱ�Ϊ��λ���·���������0С��10000������';
comment on column EB_OFFER.REFUND_1ST_MONTH
  is '���Էֱ�Ϊ��λ�����·���������0С��10000������';
comment on column EB_OFFER.REFUND_LAST_MONTH
  is '���Էֱ�Ϊ��λ��ĩ�·���������0С��10000������';
comment on column EB_OFFER.NOTES
  is '��ҵ������˵��';
comment on column EB_OFFER.LAST_STATUS
  is '0����ʷ��¼;1����';
comment on column EB_OFFER.VALID_BEGIN
  is '�������Чʱ����ʼ����';
comment on column EB_OFFER.VALID_END
  is '�������Чʱ����ֹ����';
comment on column EB_OFFER.COND_ID
  is '����α��룬��crm��������';
comment on column EB_OFFER.SCHEME_TYPE
  is '���ͻ��ѣ�1�������� 2����������� 3������������ 4: ���͹̶���(����)';
alter table EB_OFFER
  add constraint PK_EB_OFFER primary key (OFFER_ID);

prompt
prompt Creating table EB_OFFER_GROUP
prompt =============================
prompt
create table EB_OFFER_GROUP
(
  OFFER_GROUP_ID          NUMBER(11) not null,
  OFFER_GROUP_NAME        VARCHAR2(200),
  OFFER_TYPE              NUMBER(2),
  VALID_BEGIN             TIMESTAMP(6),
  VALID_END               TIMESTAMP(6),
  MARK                    VARCHAR2(80),
  SHORT_NAME              VARCHAR2(80),
  OFFER_GROUP_SORT        NUMBER(5),
  KEYWORDS                VARCHAR2(200),
  DEFAULT_IMG             VARCHAR2(800),
  PAGE_DESC               VARCHAR2(640),
  WEBSITE                 VARCHAR2(240),
  OFFER_GROUP_INTRO       VARCHAR2(1000),
  CREATE_TIME             TIMESTAMP(6),
  CHECK_TIME              TIMESTAMP(6),
  UPDATE_TIME             TIMESTAMP(6),
  ON_SALE_TIME            TIMESTAMP(6),
  CREATE_USER_ID          NUMBER(11),
  CHECKER_USER_ID         NUMBER(11),
  UPDATE_USER_ID          NUMBER(11),
  AUDIT_STATUS            NUMBER(2),
  SHOW_STATUS             NUMBER(2),
  FULL_PATH_DEPLOY        VARCHAR2(600),
  ORIGINAL_OFFER_GROUP_ID NUMBER(11),
  LAST_STATUS             NUMBER(1),
  MERCHANT_ID             NUMBER(11),
  OFFER_GROUP_NO          VARCHAR2(300),
  PROMO_TYPE              NUMBER(4),
  CATALOG_ID              VARCHAR2(20)
)
;
comment on table EB_OFFER_GROUP
  is '������飩��ECPS v1.0ֻ֧��һ�������
Name	Code	Comment	Default Value	Data Type	Length	Precision	Primary	Foreign Key	Mandatory
IS_RECYCLED	IS_RECYCLED	�Ƿ�ɾ��0��δɾ��1���Ѿ�ɾ��Ĭ��ֵ��0	0	NUMBER(2)	2		FALSE	FALSE	FALSE
OFFER_GROUP_NO	OFFER_GROUP_NO	������ţ�ϵͳ�Զ���ɡ���Ʒ����Ŀ¼����+7λ�����; ������ʼ��ţ� 30000001		VARCHAR2(50)	50		FALSE	FALSE	FALSE
������ʼ��ţ� 50000001';
comment on column EB_OFFER_GROUP.OFFER_GROUP_NAME
  is '����';
comment on column EB_OFFER_GROUP.OFFER_TYPE
  is '����ͣ�1����������2���Żݹ���3��������';
comment on column EB_OFFER_GROUP.VALID_BEGIN
  is '��Чʱ����ʼ����';
comment on column EB_OFFER_GROUP.VALID_END
  is '��Чʱ����ֹ����';
comment on column EB_OFFER_GROUP.MARK
  is '��ʶ���÷����Ψһ��ʶ�����ڷ���·����ģ���ʶ';
comment on column EB_OFFER_GROUP.SHORT_NAME
  is '���ơ�����ĸ��?��A1�е�A';
comment on column EB_OFFER_GROUP.OFFER_GROUP_SORT
  is '����';
comment on column EB_OFFER_GROUP.KEYWORDS
  is '�ؼ��';
comment on column EB_OFFER_GROUP.DEFAULT_IMG
  is '�Ĭ��ͼƬ';
comment on column EB_OFFER_GROUP.PAGE_DESC
  is 'ҳ���������ı���';
comment on column EB_OFFER_GROUP.WEBSITE
  is '������ַ�������ͨ��pms��ӣ��˴���д��ת��ַ';
comment on column EB_OFFER_GROUP.OFFER_GROUP_INTRO
  is '���顣';
comment on column EB_OFFER_GROUP.AUDIT_STATUS
  is '���״̬��0������ˣ�1�����ͨ��2�����δͨ��';
comment on column EB_OFFER_GROUP.SHOW_STATUS
  is '���¼�״̬��0.Ϊ�ϼ� 1.Ϊ�¼� 2.���ϼ�';
comment on column EB_OFFER_GROUP.FULL_PATH_DEPLOY
  is '��̬��ҳ��ķ���·��';
comment on column EB_OFFER_GROUP.LAST_STATUS
  is '0����ʷ��¼;1����';
comment on column EB_OFFER_GROUP.PROMO_TYPE
  is '����ͣ������洢��crm���صĻ���ͣ���Ӫ��ͨ�ӿ���ʹ��';
comment on column EB_OFFER_GROUP.CATALOG_ID
  is '��ӦcrmĿ¼�ڵ�ID';
alter table EB_OFFER_GROUP
  add constraint PK_EB_OFFER_GROUP primary key (OFFER_GROUP_ID);

prompt
prompt Creating table EB_OFFER_GROUP_AREA
prompt ==================================
prompt
create table EB_OFFER_GROUP_AREA
(
  AREA_ID        NUMBER(10),
  OFFER_GROUP_ID NUMBER(11)
)
;

prompt
prompt Creating table EB_OFFER_PRODUCT
prompt ===============================
prompt
create table EB_OFFER_PRODUCT
(
  OFFER_ID     NUMBER(11) not null,
  PRODUCT_CODE VARCHAR2(20),
  PRODUCT_NAME VARCHAR2(50),
  RES_CODE     VARCHAR2(20)
)
;
comment on table EB_OFFER_PRODUCT
  is 'Ӫ���β�Ʒ�?���ڼ�¼��CRMͬ�����Ĳ�Ʒ��Ϣ';
comment on column EB_OFFER_PRODUCT.OFFER_ID
  is 'Ӫ����ID';
comment on column EB_OFFER_PRODUCT.PRODUCT_CODE
  is '��Ʒ����';
comment on column EB_OFFER_PRODUCT.PRODUCT_NAME
  is '��Ʒ���';
comment on column EB_OFFER_PRODUCT.RES_CODE
  is '��Դ����';

prompt
prompt Creating table EB_ORDER
prompt =======================
prompt
create table EB_ORDER
(
  ORDER_ID             NUMBER(11) not null,
  PTL_USER_ID          NUMBER(11),
  USERNAME             VARCHAR2(100),
  ORDER_NUM            VARCHAR2(80),
  PAYMENT              NUMBER(1),
  PAY_PLATFORM         NUMBER(2),
  DELIVERY             NUMBER(1),
  IS_CONFIRM           NUMBER(1),
  ORDER_SUM            NUMBER(20,2),
  SHIP_FEE             NUMBER(20,2),
  IS_PAID              NUMBER(1),
  ORDER_STATE          NUMBER(2),
  PAYMENT_CASH         NUMBER(1),
  DISTRI_ID            NUMBER(11),
  DELIVERY_METHOD      NUMBER(1),
  PAYMENT_NO           VARCHAR2(30),
  ORDER_TIME           TIMESTAMP(6),
  PAY_TIME             TIMESTAMP(6),
  DEPOSIT_TIME         TIMESTAMP(6),
  SUCCESS_TIME         TIMESTAMP(6),
  UPDATE_TIME          TIMESTAMP(6),
  SRV_TYPE             NUMBER(2),
  SELF_COLLECT_SITE    VARCHAR2(200),
  SELF_COLLECT_SITE_ID NUMBER(11),
  IS_DELETED           NUMBER(1) default 0,
  IS_DISPLAY           NUMBER(1),
  NOTES                VARCHAR2(400),
  SHIP_NAME            VARCHAR2(80),
  PROVINCE             VARCHAR2(40),
  CITY                 VARCHAR2(40),
  DISTRICT             VARCHAR2(40),
  ZIP_CODE             VARCHAR2(40),
  ADDR                 VARCHAR2(400),
  PHONE                VARCHAR2(60),
  PAYABLE              NUMBER(1),
  COMPANY              VARCHAR2(240),
  CONTENTS             NUMBER(2),
  IS_CALL              NUMBER(1) default 0,
  DELIVERY_NO          VARCHAR2(300),
  AREA_CODE            VARCHAR2(50),
  AREA_NAME            VARCHAR2(50),
  IS_PRINT             NUMBER(1) default 0,
  CRM_CALLS_TIME       TIMESTAMP(6),
  IS_OFFER_RELEASE     NUMBER(1) default 0,
  JOB_NUM              VARCHAR2(300),
  ORDER_TYPE           NUMBER(3),
  FIXED_PHONE          VARCHAR2(50),
  ATTACH_FILE          VARCHAR2(300),
  RETURN_TYPE          NUMBER(11),
  SECKILL_ID           NUMBER(11),
  ORDER_SOURCE         NUMBER(3),
  ORDER_EXT1           VARCHAR2(1000),
  ORDER_EXT2           VARCHAR2(1000),
  ORDER_EXT3           VARCHAR2(1000),
  ORDER_EXT4           VARCHAR2(1000),
  ORDER_EXT5           VARCHAR2(1000)
)
;
comment on table EB_ORDER
  is '����������ʵ����Ʒ��������Ʒ�Ķ���';
comment on column EB_ORDER.ORDER_ID
  is '��������';
comment on column EB_ORDER.PTL_USER_ID
  is 'ǰ̨�û�����';
comment on column EB_ORDER.ORDER_NUM
  is '�����ţ������Ź��򣺶����������+6λ�����. ������ʼ��ţ�111024000001. ����λ��һ���������λ�����Ϊ��λ��';
comment on column EB_ORDER.PAYMENT
  is '֧����ʽ��1: ����֧����2: �������3: Ӫҵ��4:�ʾֻ��';
comment on column EB_ORDER.PAY_PLATFORM
  is '֧��ƽ̨��1: ��������; 2: ��������; 3: ��������';
comment on column EB_ORDER.DELIVERY
  is '�ͻ�ʱ�䣺1: ֻ�������ͻ�(˫���գ����ղ�����); 2: �����ա�˫���ա����վ���ͻ�; 3: ֻ˫���ա������ͻ�(�������ͻ�)';
comment on column EB_ORDER.IS_CONFIRM
  is '�ͻ�ǰ�绰ȷ�ϣ�0: ��; 1: ��';
comment on column EB_ORDER.ORDER_SUM
  is '�����ܽ�����������ۼ�֮�ͣ������˷ѵȡ�';
comment on column EB_ORDER.SHIP_FEE
  is '�˷�';
comment on column EB_ORDER.IS_PAID
  is 'δ����(���)=0;�Ѹ���(����ɹ�)=1;���˿�=2;�˿�ɹ�=3;�˿�ʧ��=4;����ɹ�=5;����ʧ��=6;�ر�=7;';
comment on column EB_ORDER.ORDER_STATE
  is '����״̬���μ���EbOrderStateConstants.java';
comment on column EB_ORDER.PAYMENT_CASH
  is '�������ʽ��1: �ֽ�2: POSˢ��; 3: ֧Ʊ';
comment on column EB_ORDER.DISTRI_ID
  is '������ID';
comment on column EB_ORDER.DELIVERY_METHOD
  is '�ͻ���ʽ��1����ݣ�2��Ӫҵ�����᣻3��ƽ��';
comment on column EB_ORDER.PAYMENT_NO
  is '֧����';
comment on column EB_ORDER.ORDER_TIME
  is '�µ�ʱ��';
comment on column EB_ORDER.PAY_TIME
  is '����ʱ��';
comment on column EB_ORDER.DEPOSIT_TIME
  is '����ʱ��';
comment on column EB_ORDER.SUCCESS_TIME
  is '�ɹ�ʱ��';
comment on column EB_ORDER.SRV_TYPE
  is 'ҵ�����ͣ�0����ҵ��1����Ҫд����2����Ҫ����CRM��3����Ҫд���Ͱ���CRM';
comment on column EB_ORDER.SELF_COLLECT_SITE
  is '��Ʒ��������';
comment on column EB_ORDER.SELF_COLLECT_SITE_ID
  is '����Ӫҵ��ID';
comment on column EB_ORDER.IS_DELETED
  is 'ǰ̨�û�ɾ���ǡ�1���ǣ�0����';
comment on column EB_ORDER.IS_DISPLAY
  is 'ǰ̨�û�ɾ���ǡ�1���ǣ�0����';
comment on column EB_ORDER.NOTES
  is '��ע';
comment on column EB_ORDER.SHIP_NAME
  is '�ջ�������';
comment on column EB_ORDER.PROVINCE
  is 'ʡ��';
comment on column EB_ORDER.CITY
  is '����';
comment on column EB_ORDER.DISTRICT
  is '����';
comment on column EB_ORDER.ZIP_CODE
  is '�ʱ�';
comment on column EB_ORDER.ADDR
  is '�ֵ���ַ';
comment on column EB_ORDER.PHONE
  is '��ϵ�绰';
comment on column EB_ORDER.PAYABLE
  is '��Ʊ̧ͷ��0: ����Ҫ��Ʊ��1: ���ˣ�2: ��λ';
comment on column EB_ORDER.COMPANY
  is '��λ���';
comment on column EB_ORDER.CONTENTS
  is '��Ʊ���ݣ�1: ��ϸ��2: �칫��Ʒ';
comment on column EB_ORDER.IS_CALL
  is '�Ƿ������0��δ�����1�������';
comment on column EB_ORDER.DELIVERY_NO
  is '������š�';
comment on column EB_ORDER.AREA_CODE
  is '������루������EB_CITY_AREA�?';
comment on column EB_ORDER.AREA_NAME
  is '������ƣ�������EB_CITY_AREA�?';
comment on column EB_ORDER.IS_PRINT
  is '�Ƿ��Ѵ�ӡ��Ʊ��0-δ��ӡ��1-�Ѵ�ӡ';
comment on column EB_ORDER.CRM_CALLS_TIME
  is 'crm����ɹ���ʧ�ܵ�ʱ��';
comment on column EB_ORDER.IS_OFFER_RELEASE
  is '�Ƿ�Ӫ���Լ��0-��1-�ǣ�';
comment on column EB_ORDER.JOB_NUM
  is '�����ţ���crm�ӿڷ���';
comment on column EB_ORDER.ORDER_TYPE
  is '0����1�����2���ſ���3��Ӫ��4���Ź����';
comment on column EB_ORDER.FIXED_PHONE
  is '�̶��绰';
comment on column EB_ORDER.SECKILL_ID
  is '�������ɱʱ����ֶΣ�Ϊ����ǰ̨���ҵĶ��������ܹ����ӵ��µ�����ɱҳ��';
comment on column EB_ORDER.ORDER_SOURCE
  is '0��δ����1������µ���2���׿���3��δ����4��δ��';
alter table EB_ORDER
  add constraint PK_EB_ORDER primary key (ORDER_ID);

prompt
prompt Creating table EB_ORDER_DETAIL
prompt ==============================
prompt
create table EB_ORDER_DETAIL
(
  ORDER_DETAIL_ID    NUMBER(11) not null,
  ORDER_ID           NUMBER(11),
  ITEM_ID            NUMBER(11),
  ITEM_NAME          VARCHAR2(400),
  ITEM_NO            VARCHAR2(120),
  SKU_ID             NUMBER(11),
  SKU                VARCHAR2(80),
  SKU_IMG            VARCHAR2(80),
  SKU_NAME           VARCHAR2(500),
  SKU_CAT_TYPE       NUMBER(5),
  SKU_SPEC           VARCHAR2(1000),
  MARKET_PRICE       NUMBER(20,2),
  SKU_DISCOUNT       NUMBER(20,2),
  SKU_PRICE          NUMBER(20,2),
  OFFER_GROUP_ID     NUMBER(11),
  OFFER_GROUP_NAME   VARCHAR2(200),
  OFFER_TYPE         NUMBER(2),
  SHORT_NAME         VARCHAR2(80),
  OFFER_ID           NUMBER(11),
  OFFER_NAME         VARCHAR2(800),
  OFFER_NO           VARCHAR2(120),
  SHORT_NAME2        VARCHAR2(50),
  OFFER_TERM         NUMBER(2),
  COMMIT_MONTHLY     NUMBER(20,2),
  PREPAID            NUMBER(20,2),
  PERIOD             NUMBER(2),
  REFUND_MONTHLY     NUMBER(20,2),
  REFUND_1ST_MONTH   NUMBER(20,2),
  REFUND_LAST_MONTH  NUMBER(20,2),
  ORDER_DETAIL_TYPE  NUMBER(2),
  MERCHANT_ID        NUMBER(11),
  QUANTITY           NUMBER(5),
  PRICE              NUMBER(20,2),
  SERIESCODE         VARCHAR2(3000),
  OFFER_GROUP_NO     VARCHAR2(300),
  PROMO_TYPE         NUMBER(4),
  COND_ID            VARCHAR2(20),
  PRODUCT_ID         VARCHAR2(20),
  PAYMENT_PRICE      NUMBER(20,2),
  PURCHASE_PRICE     NUMBER(20,2),
  SIMCARD_SUIT_ID    NUMBER(11),
  SIMCARD_PACKAGE_ID VARCHAR2(3000)
)
;
comment on table EB_ORDER_DETAIL
  is '3-10����Ʒ���������
11-26��Ӫ����������
Ӫ���ʱ�򣬸��SKU�������ÿ��SKU��Ӫ����Ϣһ��
��ע��
�������а�offer��offer���sku��ʱ��
�ڱ���offer�ڵ�sku��Ϣʱ��������offer��Ϣ��������¼�У����ڶ����Ĳ�ѯ��';
comment on column EB_ORDER_DETAIL.ORDER_ID
  is '��������';
comment on column EB_ORDER_DETAIL.ITEM_ID
  is '��Ʒ����';
comment on column EB_ORDER_DETAIL.ITEM_NAME
  is '��Ʒ���';
comment on column EB_ORDER_DETAIL.ITEM_NO
  is '��Ʒ��ţ��Զ���ɣ������ظ��������ɺ󲻿��޸ġ���Ź���һ��Ŀ¼���֡�1��+7λ������������ʼ���   10000001��7λ�������ʱ�Զ���Ϊ8λ��
��Ÿ��EB_ITEM.CAT_TYPE��ã���ʵ����ƷΪ1��EB_ITEM.CAT_TYPE=1��
��ɾ��
--ʵ����ʼ��ţ�   10000001 ������ʼ��ţ�   20000001��
--ע�⣺��Ʒ�Ƿ�Ϊ�ֻ��ſ���������������Ŀ����֣�CAT_IDΪ1��Ϊ�ֻ�CAT_IDΪ2��Ϊ�ſ�����
';
comment on column EB_ORDER_DETAIL.SKU_ID
  is '��С���۵�Ԫ����';
comment on column EB_ORDER_DETAIL.SKU
  is '����';
comment on column EB_ORDER_DETAIL.SKU_IMG
  is 'ͼƬ�洢λ�ã�1~5';
comment on column EB_ORDER_DETAIL.SKU_NAME
  is 'SKU���';
comment on column EB_ORDER_DETAIL.SKU_CAT_TYPE
  is '����EB_CAT��ߵ�CAT_TYPE�ֶ�ֵ�����Ա�ʾ��0�������ࣻ1��ʵ�壻2���ſ���3��������Ʒ';
comment on column EB_ORDER_DETAIL.SKU_SPEC
  is '���1�����2�����3���������N����ʽ�μ������ĵ�';
comment on column EB_ORDER_DETAIL.MARKET_PRICE
  is '(�Էֱ�Ϊ��λ)�г��ۣ����м۸���ص��ֶ��޶�Ϊ9λ��Ч�������ڣ���1234567.89���൱��ǧ��Ԫ���ڣ�����ǰ���û���ʾʱ��С����Զ����2λ��������۸������ʾΪ.00����С��۸����2λС����ֱ�ӽص�2λС���ұߵ�С�����������룩����С��Ϊ1λ����1Ԫ9�ǣ�����ʾ1.90';
comment on column EB_ORDER_DETAIL.SKU_DISCOUNT
  is '�Żݶ�';
comment on column EB_ORDER_DETAIL.SKU_PRICE
  is 'sku���ۼ�';
comment on column EB_ORDER_DETAIL.OFFER_GROUP_NAME
  is '����';
comment on column EB_ORDER_DETAIL.OFFER_TYPE
  is '����ͣ�1����������2���Żݹ���3��������';
comment on column EB_ORDER_DETAIL.SHORT_NAME
  is '���ơ�����ĸ��?��A1�е�A';
comment on column EB_ORDER_DETAIL.OFFER_ID
  is '��������';
comment on column EB_ORDER_DETAIL.OFFER_NAME
  is '����μ��';
comment on column EB_ORDER_DETAIL.OFFER_NO
  is '����α�ţ���ʼ��ţ� 50000001';
comment on column EB_ORDER_DETAIL.SHORT_NAME2
  is '��������ֱ�ţ���A1�е�1';
comment on column EB_ORDER_DETAIL.OFFER_TERM
  is 'ҵ��Э���ڣ�1��6���£�2��12���£�3��18���£�4��24����';
comment on column EB_ORDER_DETAIL.COMMIT_MONTHLY
  is '���Էֱ�Ϊ��λ���³�ŵ��ѽ�����0С��10000������';
comment on column EB_ORDER_DETAIL.PREPAID
  is '���Էֱ�Ϊ��λ��Ԥ�滰�ѽ�����0С��10000������';
comment on column EB_ORDER_DETAIL.PERIOD
  is '�����ڡ�1���������ʣ�2��6���£�3��12���£�4��18���£�5��24����';
comment on column EB_ORDER_DETAIL.REFUND_MONTHLY
  is '���Էֱ�Ϊ��λ���·���������0С��10000������';
comment on column EB_ORDER_DETAIL.REFUND_1ST_MONTH
  is '���Էֱ�Ϊ��λ�����·���������0С��10000������';
comment on column EB_ORDER_DETAIL.REFUND_LAST_MONTH
  is '���Էֱ�Ϊ��λ��ĩ�·���������0С��10000������';
comment on column EB_ORDER_DETAIL.ORDER_DETAIL_TYPE
  is '0����1�����2���ſ���3��Ӫ��4���Ź����';
comment on column EB_ORDER_DETAIL.QUANTITY
  is '����';
comment on column EB_ORDER_DETAIL.PRICE
  is '(�Էֱ�Ϊ��λ)�ɽ��۸񣨼�ʵ�ʹ���۸񣩡�����Ӫ�����򰴹�ʽsku_price+prepaid-sku_discount����';
comment on column EB_ORDER_DETAIL.SERIESCODE
  is '���ţ����ŷָ�';
comment on column EB_ORDER_DETAIL.OFFER_GROUP_NO
  is '���ţ������洢��crm�����ı��';
comment on column EB_ORDER_DETAIL.PROMO_TYPE
  is '����ͣ������洢��crm���صĻ���ͣ���Ӫ��ͨ�ӿ���ʹ��';
comment on column EB_ORDER_DETAIL.COND_ID
  is '����α��룬��crm��������';
comment on column EB_ORDER_DETAIL.SIMCARD_SUIT_ID
  is '�ſ�-�ײ�ID';
comment on column EB_ORDER_DETAIL.SIMCARD_PACKAGE_ID
  is '�ſ�-ҵ���ID';
alter table EB_ORDER_DETAIL
  add constraint PK_EB_ORDER_DETAIL primary key (ORDER_DETAIL_ID);

prompt
prompt Creating table EB_ORDER_EXECUTION
prompt =================================
prompt
create table EB_ORDER_EXECUTION
(
  ID           NUMBER(11) not null,
  ORDER_NUM    NUMBER(20),
  EXECUTION_ID NUMBER(19),
  EXECUTION    VARCHAR2(1020),
  IS_NOW       NUMBER(1)
)
;
comment on column EB_ORDER_EXECUTION.ID
  is '�������';
comment on column EB_ORDER_EXECUTION.ORDER_NUM
  is '������';
comment on column EB_ORDER_EXECUTION.EXECUTION_ID
  is '����ID';
comment on column EB_ORDER_EXECUTION.EXECUTION
  is '����ʵ��';
comment on column EB_ORDER_EXECUTION.IS_NOW
  is '�Ƿ�Ϊ��ǰʵ��';
alter table EB_ORDER_EXECUTION
  add constraint PK_EB_ORDER_EXECUTION primary key (ID);

prompt
prompt Creating table EB_ORDER_LOG
prompt ===========================
prompt
create table EB_ORDER_LOG
(
  ORDER_LOG_ID    NUMBER(11) not null,
  ORDER_ID        NUMBER(11),
  STATE_BEFORE_OP NUMBER(2),
  OP_TYPE         VARCHAR2(100),
  OP_TIME         TIMESTAMP(6),
  OP_USER_NAME    VARCHAR2(100),
  OP_NOTES        VARCHAR2(200)
)
;
comment on table EB_ORDER_LOG
  is '������־
Name	Code	Comment	Default Value	Data Type	Length	Precision	Primary	Foreign Key	Mandatory
OP_MODULE	OP_MODULE	����ģ�飺1�������2��д����3��CRM��4��������5�����ͣ�6�����᣻7��������8���˻���9���쳣��10������		NUMBER(2)	2		FALSE	FALSE	FALSE
�޸���;��������ÿ�β�����־';
comment on column EB_ORDER_LOG.ORDER_LOG_ID
  is '������־����';
comment on column EB_ORDER_LOG.ORDER_ID
  is '��������';
comment on column EB_ORDER_LOG.STATE_BEFORE_OP
  is '����ǰ����״̬';
comment on column EB_ORDER_LOG.OP_TYPE
  is '��������';
comment on column EB_ORDER_LOG.OP_TIME
  is '����ʱ��';
comment on column EB_ORDER_LOG.OP_USER_NAME
  is '�������û���';
comment on column EB_ORDER_LOG.OP_NOTES
  is '������ע';
alter table EB_ORDER_LOG
  add constraint PK_EB_ORDER_LOG primary key (ORDER_LOG_ID);

prompt
prompt Creating table EB_ORDER_REMIND_LOG
prompt ==================================
prompt
create table EB_ORDER_REMIND_LOG
(
  ID                NUMBER(11) not null,
  REMIND_MESSAGE    VARCHAR2(200),
  REMIND_RESULT     NUMBER(3),
  REMIND_TIME       TIMESTAMP(6),
  REMIND_NODE       VARCHAR2(20),
  REMIND_PHONE      VARCHAR2(20),
  REMIND_AREA_CODE  VARCHAR2(20),
  REMIND_ORDER_TYPE NUMBER(3)
)
;
comment on table EB_ORDER_REMIND_LOG
  is '��������������־��¼';
comment on column EB_ORDER_REMIND_LOG.REMIND_MESSAGE
  is '��������';
comment on column EB_ORDER_REMIND_LOG.REMIND_RESULT
  is '���ѽ���1/0';
comment on column EB_ORDER_REMIND_LOG.REMIND_TIME
  is '��������ʱ��';
comment on column EB_ORDER_REMIND_LOG.REMIND_NODE
  is '���ѷ���ڵ�';
comment on column EB_ORDER_REMIND_LOG.REMIND_PHONE
  is '�����ֻ����';
comment on column EB_ORDER_REMIND_LOG.REMIND_AREA_CODE
  is '�����˹�������';
comment on column EB_ORDER_REMIND_LOG.REMIND_ORDER_TYPE
  is '���Ѷ�������';
alter table EB_ORDER_REMIND_LOG
  add constraint PK_EB_ORDER_REMIND_LOG primary key (ID);

prompt
prompt Creating table EB_ORDER_REMIND_PHONE
prompt ====================================
prompt
create table EB_ORDER_REMIND_PHONE
(
  ID                NUMBER(11) not null,
  REMIND_PHONE      VARCHAR2(20),
  REMIND_AREA_CODE  VARCHAR2(20),
  REMIND_ORDER_TYPE NUMBER(3)
)
;
comment on table EB_ORDER_REMIND_PHONE
  is '�������������ñ�';
comment on column EB_ORDER_REMIND_PHONE.REMIND_PHONE
  is '�������ֻ����';
comment on column EB_ORDER_REMIND_PHONE.REMIND_AREA_CODE
  is '�����˹�������';
comment on column EB_ORDER_REMIND_PHONE.REMIND_ORDER_TYPE
  is '���Ѷ�������';
alter table EB_ORDER_REMIND_PHONE
  add constraint PK_EB_ORDER_REMIND_PHONE primary key (ID);

prompt
prompt Creating table EB_PARA_VALUE
prompt ============================
prompt
create table EB_PARA_VALUE
(
  PARA_ID    NUMBER(11) not null,
  ITEM_ID    NUMBER(11) not null,
  FEATURE_ID NUMBER(11) not null,
  PARA_VALUE VARCHAR2(100) not null
)
;
comment on table EB_PARA_VALUE
  is '����ֵ����۸��޹أ�';
comment on column EB_PARA_VALUE.PARA_ID
  is '����ֵ����';
comment on column EB_PARA_VALUE.PARA_VALUE
  is '����ֵ';
alter table EB_PARA_VALUE
  add constraint PK_EB_PARA_VALUE primary key (PARA_ID);

prompt
prompt Creating table EB_PAYMENT_ORG
prompt =============================
prompt
create table EB_PAYMENT_ORG
(
  PO_ID        NUMBER(11) not null,
  PO_NAME      VARCHAR2(50),
  ACCOUNT_CODE VARCHAR2(200),
  ACCOUNT_KEY  VARCHAR2(200),
  IS_OLBANK    NUMBER(1),
  PO_LOGO      VARCHAR2(500),
  PO_DESC_TYPE NUMBER(1),
  PO_DESC      VARCHAR2(50),
  PO_DESC_URL  VARCHAR2(500),
  PO_SORT      NUMBER(10),
  IS_SHOW      NUMBER(2)
)
;
comment on column EB_PAYMENT_ORG.PO_ID
  is '֧����ID';
comment on column EB_PAYMENT_ORG.PO_NAME
  is '�����';
comment on column EB_PAYMENT_ORG.ACCOUNT_CODE
  is '�̻��˺�ID';
comment on column EB_PAYMENT_ORG.ACCOUNT_KEY
  is '��Կ';
comment on column EB_PAYMENT_ORG.IS_OLBANK
  is '�Ƿ�֧������֧����1���ǣ�0����';
comment on column EB_PAYMENT_ORG.PO_LOGO
  is '����logo����Դ��������Ե�ַ';
comment on column EB_PAYMENT_ORG.PO_DESC_TYPE
  is '֧��˵����1���ı���2������';
comment on column EB_PAYMENT_ORG.PO_DESC
  is '˵������';
comment on column EB_PAYMENT_ORG.PO_DESC_URL
  is '���ӵ�ַ';
comment on column EB_PAYMENT_ORG.PO_SORT
  is '����';
comment on column EB_PAYMENT_ORG.IS_SHOW
  is '�Ƿ���ʾ��1��ǰ̨��ʾ��0������ʾ';
alter table EB_PAYMENT_ORG
  add constraint PK_EB_PAYMENT_ORG primary key (PO_ID);

prompt
prompt Creating table EB_PAYMENT_WAY
prompt =============================
prompt
create table EB_PAYMENT_WAY
(
  PW_ID   NUMBER(11) not null,
  PW_NAME VARCHAR2(200),
  PW_TEXT VARCHAR2(100),
  PW_URL  VARCHAR2(500),
  PW_MEMO VARCHAR2(500),
  PW_CODE NUMBER(1)
)
;
comment on table EB_PAYMENT_WAY
  is '�ֵ��';
comment on column EB_PAYMENT_WAY.PW_ID
  is '֧����ʽID';
comment on column EB_PAYMENT_WAY.PW_NAME
  is '֧����ʽ���';
comment on column EB_PAYMENT_WAY.PW_TEXT
  is '��������';
comment on column EB_PAYMENT_WAY.PW_URL
  is 'URL���ӵ�ַ';
comment on column EB_PAYMENT_WAY.PW_MEMO
  is '��ע';
comment on column EB_PAYMENT_WAY.PW_CODE
  is '���룺�ն���Ŀֻ������֧��';
alter table EB_PAYMENT_WAY
  add constraint PK_EB_PAYMENT_WAY primary key (PW_ID);

prompt
prompt Creating table EB_PAY_CHECK
prompt ===========================
prompt
create table EB_PAY_CHECK
(
  CHECK_ID     NUMBER(11) not null,
  PO_ID        NUMBER(11),
  OLBANK_CODE  VARCHAR2(200),
  CELLPHONE    VARCHAR2(30),
  ORDER_NUM    VARCHAR2(80),
  PAY_DATE     TIMESTAMP(6),
  TRADE_DATE   TIMESTAMP(6),
  TRADE_AMOUNT NUMBER(20),
  PAY_TYPE     VARCHAR2(2),
  BANK_TYPE    VARCHAR2(2),
  SETTLE_DATE  TIMESTAMP(6),
  TRADE_TYPE   VARCHAR2(2),
  TRADE_STATUS VARCHAR2(2),
  BANK_CHECK   VARCHAR2(2),
  PRODUCT_ID   VARCHAR2(100),
  REFUND_NO    VARCHAR2(100),
  TRANS_TIME   TIMESTAMP(6),
  ORDER_TIME   TIMESTAMP(6)
)
;
comment on column EB_PAY_CHECK.PO_ID
  is '֧����ID';
comment on column EB_PAY_CHECK.OLBANK_CODE
  is '�������';
comment on column EB_PAY_CHECK.ORDER_NUM
  is '�����ţ������Ź��򣺶����������+6λ�����. ������ʼ��ţ�111024000001. ����λ��һ���������λ�����Ϊ��λ��';
comment on column EB_PAY_CHECK.ORDER_TIME
  is '�µ�ʱ��';
alter table EB_PAY_CHECK
  add constraint PK_EB_PAY_CHECK primary key (CHECK_ID);

prompt
prompt Creating table EB_PAY_CHECK_DIFF
prompt ================================
prompt
create table EB_PAY_CHECK_DIFF
(
  CHECK_DIFF_ID NUMBER(11) not null,
  SETTLE_DATE   TIMESTAMP(6),
  PO_ID         NUMBER(11),
  DIFF_TYPE     VARCHAR2(2),
  PAY_RECODE_ID NUMBER(11),
  CHECK_ID      NUMBER(11)
)
;
comment on column EB_PAY_CHECK_DIFF.PO_ID
  is '֧����ID';
comment on column EB_PAY_CHECK_DIFF.DIFF_TYPE
  is '1-�����죻2-������֧�����У�ecpsû�У���3-�൥��֧����û�У�ecps�У���';
alter table EB_PAY_CHECK_DIFF
  add constraint PK_EB_PAY_CHECK_DIFF primary key (CHECK_DIFF_ID);

prompt
prompt Creating table EB_PAY_OLBANK
prompt ============================
prompt
create table EB_PAY_OLBANK
(
  OLBANK_ID        NUMBER(11) not null,
  PO_ID            NUMBER(11),
  OLBANK_CODE      VARCHAR2(200),
  OLBANK_NAME      VARCHAR2(50),
  OLBANK_LOGO      VARCHAR2(500),
  OLBANK_DESC_TYPE NUMBER(1),
  OLBANK_DESC      VARCHAR2(50),
  OLBANK_DESC_URL  VARCHAR2(500),
  OLBANK_SORT      NUMBER(10),
  IS_SHOW          NUMBER(2)
)
;
comment on column EB_PAY_OLBANK.OLBANK_ID
  is '֧������ID';
comment on column EB_PAY_OLBANK.PO_ID
  is '֧����ID';
comment on column EB_PAY_OLBANK.OLBANK_CODE
  is '�������';
comment on column EB_PAY_OLBANK.OLBANK_NAME
  is '�������';
comment on column EB_PAY_OLBANK.OLBANK_LOGO
  is '����logo����Դ��������Ե�ַ';
comment on column EB_PAY_OLBANK.OLBANK_DESC_TYPE
  is '֧��˵����1���ı���2������';
comment on column EB_PAY_OLBANK.OLBANK_DESC
  is '˵������';
comment on column EB_PAY_OLBANK.OLBANK_DESC_URL
  is '���ӵ�ַ';
comment on column EB_PAY_OLBANK.OLBANK_SORT
  is '����';
comment on column EB_PAY_OLBANK.IS_SHOW
  is '�Ƿ���ʾ��1��ǰ̨��ʾ��0������ʾ';
alter table EB_PAY_OLBANK
  add constraint PK_EB_PAY_OLBANK primary key (OLBANK_ID);

prompt
prompt Creating table EB_PAY_RECORD
prompt ============================
prompt
create table EB_PAY_RECORD
(
  PAY_RECODE_ID    NUMBER(11) not null,
  PAY_RECODE_NUM   VARCHAR2(200),
  ORDER_ID         NUMBER(11),
  ORDER_NUM        VARCHAR2(80),
  PO_ID            NUMBER(11),
  OLBANK_ID        NUMBER(11),
  USER_ID          NUMBER(11),
  OPERATOR_NAME    VARCHAR2(100),
  PTL_USER_ID      NUMBER(11),
  TRADE_NUM        VARCHAR2(100),
  BUZI_TYPE        NUMBER(2),
  TRADE_STATUS     NUMBER(2),
  ORDER_TIME       TIMESTAMP(6),
  TRADE_CREATEDATE TIMESTAMP(6),
  TRADE_RESPDATE   TIMESTAMP(6),
  TRADE_DATE       TIMESTAMP(6),
  TRADE_CURRENCY   VARCHAR2(10),
  TRADE_AMOUNT     NUMBER(20),
  SETTLE_DATE      TIMESTAMP(6),
  RET_CODE         VARCHAR2(10),
  RET_MSG          VARCHAR2(800),
  NOTIFY_CODE      VARCHAR2(10),
  NOTIFY_MSG       VARCHAR2(800),
  PAY_NOTICE_URL   VARCHAR2(500),
  PAY_RET_URL      VARCHAR2(500),
  CELLPHONE        VARCHAR2(30),
  IP_ADDRESS       VARCHAR2(30),
  EMAIL            VARCHAR2(100),
  MEMO             VARCHAR2(1000)
)
;
comment on column EB_PAY_RECORD.ORDER_ID
  is '��������';
comment on column EB_PAY_RECORD.ORDER_NUM
  is '�����ţ������Ź��򣺶����������+6λ�����. ������ʼ��ţ�111024000001. ����λ��һ���������λ�����Ϊ��λ��';
comment on column EB_PAY_RECORD.PO_ID
  is '֧����ID';
comment on column EB_PAY_RECORD.OLBANK_ID
  is '֧������ID';
comment on column EB_PAY_RECORD.USER_ID
  is '��̨�û�����';
comment on column EB_PAY_RECORD.OPERATOR_NAME
  is '���ࣺ��̨�û����';
comment on column EB_PAY_RECORD.PTL_USER_ID
  is 'ǰ̨�û�����';
comment on column EB_PAY_RECORD.TRADE_NUM
  is '���׺�';
comment on column EB_PAY_RECORD.BUZI_TYPE
  is '1-֧����2-����3-����4-�˿�';
comment on column EB_PAY_RECORD.TRADE_STATUS
  is '1-���״�����2-���׳ɹ���3-���׹رգ�4-���׳���5-����ʧ�ܣ�99-ϵͳδ��Ӧ';
comment on column EB_PAY_RECORD.ORDER_TIME
  is '�µ�ʱ��';
comment on column EB_PAY_RECORD.TRADE_RESPDATE
  is 'ͬ��ʱ��';
comment on column EB_PAY_RECORD.TRADE_DATE
  is '�첽ʱ��';
comment on column EB_PAY_RECORD.TRADE_CURRENCY
  is 'RMB';
comment on column EB_PAY_RECORD.RET_CODE
  is 'ͬ����Ϣ�Ľ��';
comment on column EB_PAY_RECORD.RET_MSG
  is 'ͬ����Ϣ�Ľ��';
comment on column EB_PAY_RECORD.NOTIFY_CODE
  is '�첽��Ϣ�Ľ��';
comment on column EB_PAY_RECORD.NOTIFY_MSG
  is '�첽��Ϣ�Ľ��';
comment on column EB_PAY_RECORD.MEMO
  is '��¼��д�����˿����ʱ��ԭ��';
alter table EB_PAY_RECORD
  add constraint PK_EB_PAY_RECORD primary key (PAY_RECODE_ID);

prompt
prompt Creating table EB_PAY_TOTAL
prompt ===========================
prompt
create table EB_PAY_TOTAL
(
  CHECK_TOTAL_ID    NUMBER(11) not null,
  PO_ID             NUMBER(11),
  CHECK_DATE        TIMESTAMP(6),
  CHECK_STATUS      VARCHAR2(2),
  RECORD_TYPE       VARCHAR2(2),
  PO_PAYTOTAL       NUMBER(20),
  PO_PAYAMOUNT      NUMBER(20),
  EC_PAYTOTAL       NUMBER(20),
  EC_PAYAMOUNT      NUMBER(20),
  PAYDIFF_AMOUNT    NUMBER(20),
  PO_REFUNDTOTAL    NUMBER(20),
  PO_REFUNDAMOUNT   NUMBER(20),
  EC_REFUNDTOTAL    NUMBER(20),
  EC_REFUNDAMOUNT   NUMBER(20),
  REFUNDDIFF_AMOUNT NUMBER(20)
)
;
comment on column EB_PAY_TOTAL.PO_ID
  is '֧����ID';
comment on column EB_PAY_TOTAL.RECORD_TYPE
  is '1-ÿ�������ͳ����Ϣ��2-������Ϣ';
alter table EB_PAY_TOTAL
  add constraint PK_EB_PAY_TOTAL primary key (CHECK_TOTAL_ID);

prompt
prompt Creating table EB_PERMISSION
prompt ============================
prompt
create table EB_PERMISSION
(
  PERM_ID       NUMBER(11) not null,
  PERM_UPID     NUMBER(11),
  PERM_TYPE     NUMBER(1),
  PERM_NAME     VARCHAR2(100),
  PERM_URL      VARCHAR2(100),
  DEPENDENT_URL VARCHAR2(2000),
  PERM_USE      NUMBER(1),
  PERM_ORDER    NUMBER(3),
  PERM_NOTE     VARCHAR2(100)
)
;
comment on column EB_PERMISSION.PERM_ID
  is 'Ȩ������';
alter table EB_PERMISSION
  add constraint PK_EB_PERMISSION primary key (PERM_ID);

prompt
prompt Creating table EB_PUBLISH_STATE
prompt ===============================
prompt
create table EB_PUBLISH_STATE
(
  PS_TYPE                 VARCHAR2(2) not null,
  PS_KEY                  NUMBER(11) not null,
  PS_LASTMODIFYTIME       TIMESTAMP(6) not null,
  PS_LASTPUBLISHSTARTTIME TIMESTAMP(6),
  PS_RESULT               NUMBER(1)
)
;
comment on table EB_PUBLISH_STATE
  is '����״̬��';
comment on column EB_PUBLISH_STATE.PS_TYPE
  is '��������: 01-home��ҳ, 02-channel����, 03-content����, 04-topic, 05-other,99-unknown';
comment on column EB_PUBLISH_STATE.PS_KEY
  is '����ҵ������';
comment on column EB_PUBLISH_STATE.PS_LASTMODIFYTIME
  is '���һ���޸�ʱ��';
comment on column EB_PUBLISH_STATE.PS_LASTPUBLISHSTARTTIME
  is '���һ�η�����ʼʱ��';
comment on column EB_PUBLISH_STATE.PS_RESULT
  is '�������:0-ʧ��,1-�ɹ�';
alter table EB_PUBLISH_STATE
  add constraint PK_EB_PUBLISH_STATE primary key (PS_TYPE, PS_KEY);

prompt
prompt Creating table EB_RECOMM_ITEM
prompt =============================
prompt
create table EB_RECOMM_ITEM
(
  RECOMM_ID      NUMBER(30) not null,
  ITEM_ID        NUMBER(30),
  ITEM_HIGHLIGHT VARCHAR2(200),
  CONTR_HIGHL    VARCHAR2(200),
  NOTE           VARCHAR2(500),
  EXPAN_PARAM1   VARCHAR2(100),
  EXPAN_PARAM2   VARCHAR2(200)
)
;
alter table EB_RECOMM_ITEM
  add constraint PK_EB_RECOMM_ITEM primary key (RECOMM_ID);

prompt
prompt Creating table EB_REGION
prompt ========================
prompt
create table EB_REGION
(
  REGION_ID   NUMBER(11) not null,
  AREA_ID     NUMBER(11),
  REGION_CODE VARCHAR2(200),
  REGION_NAME VARCHAR2(200)
)
;
alter table EB_REGION
  add constraint PK_EB_REGION primary key (REGION_ID);

prompt
prompt Creating table EB_RET_EXC
prompt =========================
prompt
create table EB_RET_EXC
(
  RET_EXC_ID      NUMBER(11) not null,
  ORDER_ID        NUMBER(11) not null,
  ORDER_DETAIL_ID NUMBER(11),
  REASON          VARCHAR2(1000),
  RET_EXC_TYPE    NUMBER(1),
  STATUS          NUMBER(1),
  REQ_TIME        TIMESTAMP(6),
  WAY_TYPE        NUMBER(1),
  CONTACT         VARCHAR2(100),
  PHONE           VARCHAR2(100)
)
;
comment on table EB_RET_EXC
  is '�������˻�����¼���˻���ֻά��������һ����ͨ����������������ά��ĳ����������˻�����ϵͳ�����?������˻�����';
comment on column EB_RET_EXC.RET_EXC_ID
  is '�˻�������';
comment on column EB_RET_EXC.REASON
  is '������������д�˻�����ԭ�򼰶����������';
comment on column EB_RET_EXC.RET_EXC_TYPE
  is '�˻������ͣ�1: ������2: �˻�';
comment on column EB_RET_EXC.STATUS
  is '�˻���״̬��1: ���ύ��2: �����У�3: �����';
comment on column EB_RET_EXC.REQ_TIME
  is '�����˻���ʱ��';
comment on column EB_RET_EXC.WAY_TYPE
  is 'ȡ��ʽ��1��ǰ̨ȡ��2����̨ȡ��';
comment on column EB_RET_EXC.CONTACT
  is '��ϵ��';
comment on column EB_RET_EXC.PHONE
  is '��ϵ�绰';
alter table EB_RET_EXC
  add constraint PK_EB_RET_EXC primary key (RET_EXC_ID);

prompt
prompt Creating table EB_ROLEPERM
prompt ==========================
prompt
create table EB_ROLEPERM
(
  PERM_ID NUMBER(11) not null,
  ROLE_ID NUMBER(11) not null
)
;
comment on table EB_ROLEPERM
  is '��ɫȨ��';
alter table EB_ROLEPERM
  add constraint PK_EB_ROLEPERM primary key (PERM_ID, ROLE_ID);

prompt
prompt Creating table EB_ROLE_AREA
prompt ===========================
prompt
create table EB_ROLE_AREA
(
  AREA_ID         NUMBER(11),
  ROLE_ID         NUMBER(11),
  PERMISSION_TYPE NUMBER(2)
)
;
comment on column EB_ROLE_AREA.ROLE_ID
  is '��ɫ����';

prompt
prompt Creating table EB_ROLE_BUSINESS_SCOPE
prompt =====================================
prompt
create table EB_ROLE_BUSINESS_SCOPE
(
  BUSINESS_SCOPE_ID NUMBER(3) not null,
  ROLE_ID           NUMBER(11) not null
)
;
comment on column EB_ROLE_BUSINESS_SCOPE.BUSINESS_SCOPE_ID
  is '��Ӫ��Χ����';
comment on column EB_ROLE_BUSINESS_SCOPE.ROLE_ID
  is '��ɫ����';
alter table EB_ROLE_BUSINESS_SCOPE
  add constraint PK_EB_ROLE_BUSINESS_SCOPE primary key (BUSINESS_SCOPE_ID, ROLE_ID);

prompt
prompt Creating table EB_ROLE_ORDER_TYPE
prompt =================================
prompt
create table EB_ROLE_ORDER_TYPE
(
  ROLE_ID    NUMBER(11) not null,
  ORDER_TYPE NUMBER(3) not null
)
;
comment on column EB_ROLE_ORDER_TYPE.ROLE_ID
  is '��ɫ����';
comment on column EB_ROLE_ORDER_TYPE.ORDER_TYPE
  is '��Ӧ������Ķ������ͣ�
0����1�����2���ſ���3��Ӫ��4���Ź����';
alter table EB_ROLE_ORDER_TYPE
  add constraint PK_EB_ROLE_ORDER_TYPE primary key (ROLE_ID, ORDER_TYPE);

prompt
prompt Creating table EB_SAFETY_CONFIG
prompt ===============================
prompt
create table EB_SAFETY_CONFIG
(
  SAFETY_ID                  NUMBER(2) not null,
  SAFETY_MAX_RESULT          VARCHAR2(20),
  SAFETY_SEARCH_MIN          NUMBER(5),
  SAFETY_SEARCH_MAX          NUMBER(5),
  SAFETY_SESSION_TIME        NUMBER(10),
  SAFETY_LOGIN_LOG           NUMBER(1),
  SAFETY_OPERATE_LOG         NUMBER(1),
  SAFETY_ABSTRACT_LENGTH     VARCHAR2(20),
  SAFETY_BACKUP_PATH         VARCHAR2(200),
  SAFETY_STATIC_PAGE_SUFFIX  VARCHAR2(10),
  SAFETY_DYNAMIC_PAGE_SUFFIX VARCHAR2(10)
)
;
comment on table EB_SAFETY_CONFIG
  is 'PMS��ȫ���ñ�';
comment on column EB_SAFETY_CONFIG.SAFETY_ID
  is '���';
comment on column EB_SAFETY_CONFIG.SAFETY_MAX_RESULT
  is '��󷵻����������';
comment on column EB_SAFETY_CONFIG.SAFETY_SEARCH_MIN
  is '�����ؼ�����С����';
comment on column EB_SAFETY_CONFIG.SAFETY_SEARCH_MAX
  is '�����ؼ�����󳤶�';
comment on column EB_SAFETY_CONFIG.SAFETY_SESSION_TIME
  is '��̨��½��ʱʱ������';
comment on column EB_SAFETY_CONFIG.SAFETY_LOGIN_LOG
  is '��¼��¼��־';
comment on column EB_SAFETY_CONFIG.SAFETY_OPERATE_LOG
  is '��¼������־';
comment on column EB_SAFETY_CONFIG.SAFETY_ABSTRACT_LENGTH
  is '�Զ�ժҪ����';
comment on column EB_SAFETY_CONFIG.SAFETY_BACKUP_PATH
  is '��ݱ���·��';
comment on column EB_SAFETY_CONFIG.SAFETY_STATIC_PAGE_SUFFIX
  is '��̬ҳ��׺';
comment on column EB_SAFETY_CONFIG.SAFETY_DYNAMIC_PAGE_SUFFIX
  is '��̬ҳ��׺';
alter table EB_SAFETY_CONFIG
  add constraint PK_EB_SAFETY_CONFIG primary key (SAFETY_ID);

prompt
prompt Creating table EB_SECKILL
prompt =========================
prompt
create table EB_SECKILL
(
  SECKILL_ID          NUMBER(11) not null,
  ACTIVITY_TYPE       NUMBER(3),
  SECKILL_TITLE       VARCHAR2(3000),
  SECKILL_IMG         VARCHAR2(600),
  GIFT_INFO           VARCHAR2(3000),
  SECKILL_ORDER       NUMBER(10),
  NOTICE_ORDER        NUMBER(10),
  SALES               NUMBER(10),
  START_TIME          TIMESTAMP(6),
  END_TIME            TIMESTAMP(6),
  IS_RECOMMEND        NUMBER(1),
  LIMIT_SECKILL_TIMES NUMBER(10),
  LIMIT_SECKILL_COUNT NUMBER(10),
  IS_DELETE           NUMBER(1)
)
;
comment on column EB_SECKILL.ACTIVITY_TYPE
  is '1��ɱ�����ݲ�Ʒ��˵���������ͺ��Ź���Ĳ�ͬ��������ָ�Ժ���ɱ���ܻ���ڶ�����ɱ���ͣ�';
comment on column EB_SECKILL.IS_RECOMMEND
  is '0-���Ƽ���1-��ҳ�Ƽ���';
comment on column EB_SECKILL.LIMIT_SECKILL_TIMES
  is '0Ϊ�����ƣ�����0�������뵽����Ʒ�Ĵ���';
comment on column EB_SECKILL.LIMIT_SECKILL_COUNT
  is '0Ϊ�����ƣ�����0��������ɱʱ����Ĺ�������';
alter table EB_SECKILL
  add constraint PK_EB_SECKILL primary key (SECKILL_ID);

prompt
prompt Creating table EB_SECKILL_INFO
prompt ==============================
prompt
create table EB_SECKILL_INFO
(
  SECKILL_ID NUMBER(11) not null,
  INFO       CLOB
)
;
comment on column EB_SECKILL_INFO.INFO
  is '��ܰ��ʾ';
alter table EB_SECKILL_INFO
  add constraint PK_EB_SECKILL_INFO primary key (SECKILL_ID);

prompt
prompt Creating table EB_SECKILL_QUA
prompt =============================
prompt
create table EB_SECKILL_QUA
(
  SECKILL_QUA_ID NUMBER(11) not null,
  PTL_USER_ID    NUMBER(11),
  SECKILL_ID     NUMBER(11),
  SKU_ID         NUMBER(11),
  SECKILL_TIME   TIMESTAMP(6),
  QUANTITY       NUMBER(5),
  ORDER_ID       NUMBER(11),
  IS_EXPIRED     NUMBER(1)
)
;
comment on column EB_SECKILL_QUA.PTL_USER_ID
  is 'ǰ̨�û�����';
comment on column EB_SECKILL_QUA.SKU_ID
  is '��С���۵�Ԫ����';
comment on column EB_SECKILL_QUA.SECKILL_TIME
  is '��ɱ����Ʒʱ��ʱ�䣬���ںͶ�ʱ����ʱ��Ƚ�';
comment on column EB_SECKILL_QUA.QUANTITY
  is '���ι�������������ڵ��ʸ�����ʱ������ɱ������Ʒ���';
comment on column EB_SECKILL_QUA.ORDER_ID
  is '����ȡ��ɱ�ʸ�ʱΪ�գ����ɹ��µ��������ֶΣ�������ɱ�Ͷ����İ�';
comment on column EB_SECKILL_QUA.IS_EXPIRED
  is '�Ƿ�ʧЧ��1ΪʧЧ';
alter table EB_SECKILL_QUA
  add constraint PK_EB_SECKILL_QUA primary key (SECKILL_QUA_ID);

prompt
prompt Creating table EB_SECKILL_SKU
prompt =============================
prompt
create table EB_SECKILL_SKU
(
  SECKILL_ID    NUMBER(11) not null,
  SKU_ID        NUMBER(11) not null,
  SECKILL_COUNT NUMBER(10),
  SECKILL_PRICE NUMBER(20,2),
  ORDER_NO      NUMBER(10)
)
;
comment on column EB_SECKILL_SKU.SKU_ID
  is '��С���۵�Ԫ����';
comment on column EB_SECKILL_SKU.SECKILL_COUNT
  is '������ɱ����Ʒ����������С����Ʒ�����';
alter table EB_SECKILL_SKU
  add constraint PK_EB_SECKILL_SKU primary key (SECKILL_ID, SKU_ID);

prompt
prompt Creating table EB_SENSITIVE_WORD
prompt ================================
prompt
create table EB_SENSITIVE_WORD
(
  SENSITIVE_WORD_ID   NUMBER(11) not null,
  SENSITIVE_WORD_NAME VARCHAR2(60),
  STATUS              NUMBER(1),
  CREATE_TIME         TIMESTAMP(6),
  CREATOR             VARCHAR2(20),
  EFFECT_MODULE       VARCHAR2(200)
)
;
comment on table EB_SENSITIVE_WORD
  is '���д�';
comment on column EB_SENSITIVE_WORD.SENSITIVE_WORD_ID
  is '���д�ID';
comment on column EB_SENSITIVE_WORD.SENSITIVE_WORD_NAME
  is '���д����';
comment on column EB_SENSITIVE_WORD.STATUS
  is '״̬';
comment on column EB_SENSITIVE_WORD.CREATE_TIME
  is '����ʱ��';
comment on column EB_SENSITIVE_WORD.CREATOR
  is '������';
comment on column EB_SENSITIVE_WORD.EFFECT_MODULE
  is '��Чģ��';
alter table EB_SENSITIVE_WORD
  add constraint EB_SENSITIVE_WORD_PK primary key (SENSITIVE_WORD_ID);

prompt
prompt Creating table EB_SHIP_ADDR
prompt ===========================
prompt
create table EB_SHIP_ADDR
(
  SHIP_ADDR_ID NUMBER(11) not null,
  PTL_USER_ID  NUMBER(11),
  SHIP_NAME    VARCHAR2(80) not null,
  PROVINCE     VARCHAR2(40) not null,
  CITY         VARCHAR2(40) not null,
  DISTRICT     VARCHAR2(40) not null,
  ZIP_CODE     VARCHAR2(40),
  ADDR         VARCHAR2(400) not null,
  PHONE        VARCHAR2(60),
  DEFAULT_ADDR NUMBER(1) default 0 not null,
  FIXED_PHONE  VARCHAR2(50)
)
;
comment on table EB_SHIP_ADDR
  is '�ջ���ַ';
comment on column EB_SHIP_ADDR.SHIP_ADDR_ID
  is '�ջ��˵�ַ����';
comment on column EB_SHIP_ADDR.PTL_USER_ID
  is 'ǰ̨�û�ID';
comment on column EB_SHIP_ADDR.SHIP_NAME
  is '�ջ�������';
comment on column EB_SHIP_ADDR.PROVINCE
  is 'ʡ��';
comment on column EB_SHIP_ADDR.CITY
  is '����';
comment on column EB_SHIP_ADDR.DISTRICT
  is '����';
comment on column EB_SHIP_ADDR.ZIP_CODE
  is '�ʱ�';
comment on column EB_SHIP_ADDR.ADDR
  is '�ֵ���ַ';
comment on column EB_SHIP_ADDR.PHONE
  is '��ϵ�绰';
comment on column EB_SHIP_ADDR.DEFAULT_ADDR
  is 'Ĭ���ջ���ַ����ΪĬ���ջ���ַ��Ϊ1��';
comment on column EB_SHIP_ADDR.FIXED_PHONE
  is '�̶��绰';
alter table EB_SHIP_ADDR
  add constraint PK_EB_SHIP_ADDR primary key (SHIP_ADDR_ID);

prompt
prompt Creating table EB_SIMCARD
prompt =========================
prompt
create table EB_SIMCARD
(
  SIMCARD_ID       NUMBER(11) not null,
  SIMCARD_BRAND_ID NUMBER(11),
  SIMCARD_SUIT_ID  NUMBER(11),
  SIMCARD_BRAND    VARCHAR2(200),
  SIMCARD_NUM      VARCHAR2(20),
  SIMCARD_RANGE    VARCHAR2(11),
  SIMCARD_LOCALE   VARCHAR2(50),
  SHOW_STATUS      NUMBER(2),
  SALE_STATUS      NUMBER(2),
  LOCK_STATUS      NUMBER(2),
  LOCKED_TIME      TIMESTAMP(6),
  LOCKED_USERID    NUMBER(11),
  PREPAID          NUMBER(20),
  SIMCARD_NO       VARCHAR2(200),
  AREA_ID          NUMBER(11),
  IS_DELETED       NUMBER(2),
  FEE_OFFER_ID     VARCHAR2(20),
  FEE_OFFER_NAME   VARCHAR2(50)
)
;
comment on column EB_SIMCARD.SIMCARD_BRAND
  is '������ʽ�ָ�';
comment on column EB_SIMCARD.SIMCARD_LOCALE
  is '�������⣬��ȷ��';
comment on column EB_SIMCARD.SHOW_STATUS
  is '0�¼ܣ�1�ϼ�';
comment on column EB_SIMCARD.SALE_STATUS
  is '1�����ۣ�2��Ԥռ��3������';
comment on column EB_SIMCARD.LOCK_STATUS
  is '0δ��1��';
comment on column EB_SIMCARD.SIMCARD_NO
  is '��CRM�л�ȡ';
comment on column EB_SIMCARD.AREA_ID
  is '���ֶκ�EB_CITY_AREA����';
comment on column EB_SIMCARD.IS_DELETED
  is 'ɾ���־λ��0-ɾ�� 1-δɾ��';
comment on column EB_SIMCARD.FEE_OFFER_ID
  is '���ײ߻�����';
comment on column EB_SIMCARD.FEE_OFFER_NAME
  is '���ײ߻����';
alter table EB_SIMCARD
  add constraint PK_EB_SIMCARD primary key (SIMCARD_ID);

prompt
prompt Creating table EB_SIMCARD_BRAND
prompt ===============================
prompt
create table EB_SIMCARD_BRAND
(
  SIMCARD_BRAND_ID        NUMBER(11) not null,
  SIMCARD_BRAND_NO        VARCHAR2(20),
  SIMCARD_BRAND_NAME      VARCHAR2(100),
  SIMCARD_BRAND_DESC      VARCHAR2(4000),
  SIMCARD_BRAND_AGREEMENT CLOB
)
;
alter table EB_SIMCARD_BRAND
  add constraint PK_EB_SIMCARD_BRAND primary key (SIMCARD_BRAND_ID);

prompt
prompt Creating table EB_SIMCARD_LABEL
prompt ===============================
prompt
create table EB_SIMCARD_LABEL
(
  LABEL_ID   NUMBER(11) not null,
  LABEL_NAME VARCHAR2(200),
  LABEL_NUM  VARCHAR2(50),
  LABEL_DESC VARCHAR2(4000),
  STATUS     NUMBER(2)
)
;
comment on column EB_SIMCARD_LABEL.LABEL_NUM
  is '��ʱ����';
comment on column EB_SIMCARD_LABEL.STATUS
  is '����״̬��0: ͣ��; 1: ����';
alter table EB_SIMCARD_LABEL
  add constraint PK_EB_SIMCARD_LABEL primary key (LABEL_ID);

prompt
prompt Creating table EB_SIMCARD_LABEL_REL
prompt ===================================
prompt
create table EB_SIMCARD_LABEL_REL
(
  SIMCARD_LABEL_REL_ID NUMBER(11) not null,
  SIMCARD_ID           NUMBER(11),
  SIMCARDLABEL_ID      NUMBER(11)
)
;
alter table EB_SIMCARD_LABEL_REL
  add constraint PK_EB_SIMCARD_LABEL_REL primary key (SIMCARD_LABEL_REL_ID);

prompt
prompt Creating table EB_SIMCARD_PROCESS_LOG
prompt =====================================
prompt
create table EB_SIMCARD_PROCESS_LOG
(
  LOG_ID           NUMBER(11) not null,
  LOG_MSG          VARCHAR2(2000),
  LOG_ORDER_NUMBER VARCHAR2(50),
  LOG_FILE_PATH    VARCHAR2(200),
  LOG_TIME         TIMESTAMP(6),
  LOG_EXT1         VARCHAR2(200),
  LOG_EXT2         VARCHAR2(200)
)
;
comment on column EB_SIMCARD_PROCESS_LOG.LOG_ID
  is '��־����';
comment on column EB_SIMCARD_PROCESS_LOG.LOG_MSG
  is '������Ϣ';
comment on column EB_SIMCARD_PROCESS_LOG.LOG_ORDER_NUMBER
  is '��������Ӧ�еĶ������';
comment on column EB_SIMCARD_PROCESS_LOG.LOG_FILE_PATH
  is '������־�ļ�·��';
comment on column EB_SIMCARD_PROCESS_LOG.LOG_TIME
  is '����ʱ��';
comment on column EB_SIMCARD_PROCESS_LOG.LOG_EXT1
  is '��չ�ֶ�1';
comment on column EB_SIMCARD_PROCESS_LOG.LOG_EXT2
  is '��չ�ֶ�2';

prompt
prompt Creating table EB_SIMCARD_SUIT
prompt ==============================
prompt
create table EB_SIMCARD_SUIT
(
  SIMCARD_SUIT_ID         NUMBER(11) not null,
  SIMCARD_BRAND_ID        NUMBER(11),
  SIMCARD_SUIT_NAME       VARCHAR2(200),
  SIMCARD_SUIT_IDENTIFIER VARCHAR2(200),
  SIMCARD_SUIT_DESC       VARCHAR2(4000),
  SIMCARD_SUIT_SORT       NUMBER(10),
  AREA_ID                 NUMBER(11),
  PREPAID                 NUMBER(20),
  CASH_PLEDGE             NUMBER(20),
  SIMCARD_PRICE           NUMBER(20),
  SUIT_LOCALE             VARCHAR2(50),
  IS_DELETED              NUMBER(2)
)
;
comment on column EB_SIMCARD_SUIT.SIMCARD_SUIT_IDENTIFIER
  is 'CRM ID';
comment on column EB_SIMCARD_SUIT.IS_DELETED
  is 'ɾ���־λ��0-ɾ�� 1-δɾ��';
alter table EB_SIMCARD_SUIT
  add constraint PK_EB_SIMCARD_SUIT primary key (SIMCARD_SUIT_ID);

prompt
prompt Creating table EB_SIM_IDCARD
prompt ============================
prompt
create table EB_SIM_IDCARD
(
  SIM_IDCARD_ID   NUMBER(11) not null,
  SUBSCRIBER_NAME VARCHAR2(80),
  IDCARD_TYPE     NUMBER(2),
  ID_NUM          VARCHAR2(40),
  ID_ADDR         VARCHAR2(400),
  ID_VALID_TO     TIMESTAMP(6),
  PHONE           VARCHAR2(50),
  PTL_USER_ID     NUMBER(11),
  ORDER_DETAIL_ID NUMBER(11)
)
;
comment on table EB_SIM_IDCARD
  is '�ſ������֤';
comment on column EB_SIM_IDCARD.SUBSCRIBER_NAME
  is '��������';
comment on column EB_SIM_IDCARD.IDCARD_TYPE
  is '֤�����͡�1�����֤��2�����֤';
comment on column EB_SIM_IDCARD.ID_NUM
  is '֤�����롣';
comment on column EB_SIM_IDCARD.ID_ADDR
  is '֤����ַ��';
comment on column EB_SIM_IDCARD.ID_VALID_TO
  is '֤������ʱ��';
comment on column EB_SIM_IDCARD.PHONE
  is '��ϵ�绰';
comment on column EB_SIM_IDCARD.PTL_USER_ID
  is 'ĳ���ſ���Ϣ����ĳ���û�����';
alter table EB_SIM_IDCARD
  add constraint PK_EB_SIM_IDCARD primary key (SIM_IDCARD_ID);

prompt
prompt Creating table EB_SITE_CONFIG
prompt =============================
prompt
create table EB_SITE_CONFIG
(
  SITE_ID                NUMBER(2) not null,
  SITE_BASIC_DOMAIN      VARCHAR2(100),
  SITE_BASIC_PATH        VARCHAR2(200),
  SITE_BASIC_OPTION      NUMBER(1),
  SITE_SEO_TITLE         VARCHAR2(100),
  SITE_SEO_KEYWORD       VARCHAR2(300),
  SITE_SEO_DESCRIPTION   VARCHAR2(500),
  SITE_PATH_HTML         VARCHAR2(100),
  SITE_PATH_RESOURCE     VARCHAR2(100),
  SITE_RECYCLE_MODE      NUMBER(1),
  SITE_FTP_HOST          VARCHAR2(50),
  SITE_FTP_PORT          NUMBER(16),
  SITE_BASIC_PREADDRESS  VARCHAR2(50),
  SITE_BASIC_MAILADDRESS VARCHAR2(50),
  SITE_BASIC_PHONE       VARCHAR2(30),
  SITE_ANNOUNCE          VARCHAR2(200),
  SITE_ECPS_CHECK        VARCHAR2(300),
  SITE_SECKILL_TIMEOUT   NUMBER(16)
)
;
comment on table EB_SITE_CONFIG
  is 'ϵͳ���ñ�-Դ��PMS v4.0
��Ҫ�����ֶΣ�';
comment on column EB_SITE_CONFIG.SITE_ID
  is '���';
comment on column EB_SITE_CONFIG.SITE_BASIC_DOMAIN
  is 'վ������';
comment on column EB_SITE_CONFIG.SITE_BASIC_PATH
  is '·��';
comment on column EB_SITE_CONFIG.SITE_BASIC_OPTION
  is '�Ƿ����·��';
comment on column EB_SITE_CONFIG.SITE_SEO_TITLE
  is 'վ�����';
comment on column EB_SITE_CONFIG.SITE_SEO_KEYWORD
  is 'վ��ؼ���';
comment on column EB_SITE_CONFIG.SITE_SEO_DESCRIPTION
  is 'վ������';
comment on column EB_SITE_CONFIG.SITE_PATH_HTML
  is '�ĵ�HTML����·��';
comment on column EB_SITE_CONFIG.SITE_PATH_RESOURCE
  is 'ͼƬ����������·��';
comment on column EB_SITE_CONFIG.SITE_RECYCLE_MODE
  is '�Ƿ�������վ';
comment on column EB_SITE_CONFIG.SITE_FTP_HOST
  is 'FTP��������ַ';
comment on column EB_SITE_CONFIG.SITE_FTP_PORT
  is 'FTP�˿�';
comment on column EB_SITE_CONFIG.SITE_BASIC_PREADDRESS
  is 'Ԥ�������Ե�ַ';
comment on column EB_SITE_CONFIG.SITE_BASIC_MAILADDRESS
  is '����Ա����';
comment on column EB_SITE_CONFIG.SITE_BASIC_PHONE
  is '����Ա�绰';
comment on column EB_SITE_CONFIG.SITE_ANNOUNCE
  is '�̳ǹ���';
comment on column EB_SITE_CONFIG.SITE_SECKILL_TIMEOUT
  is '��ɱ֧����ʱʱ��,��λ���롯, ע�����û���ȡ��ɱ�ʸ�󳬹���ֶ����õ�ֵδ֧�����򶩵����ϲ�������ɱ���)��';
alter table EB_SITE_CONFIG
  add constraint PK_EB_SITE_CONFIG primary key (SITE_ID);

prompt
prompt Creating table EB_SKU
prompt =====================
prompt
create table EB_SKU
(
  SKU_ID          NUMBER(11) not null,
  ITEM_ID         NUMBER(11) not null,
  SKU             VARCHAR2(80),
  SKU_PRICE       NUMBER(20,2) not null,
  SHOW_STATUS     NUMBER(2),
  STOCK_INVENTORY NUMBER(5) not null,
  SKU_UPPER_LIMIT NUMBER(5),
  LOCATION        VARCHAR2(80),
  SKU_IMG         VARCHAR2(80),
  SKU_SORT        NUMBER(5),
  SKU_NAME        VARCHAR2(500),
  MARKET_PRICE    NUMBER(20,2),
  CREATE_TIME     TIMESTAMP(6),
  UPDATE_TIME     TIMESTAMP(6),
  CREATE_USER_ID  NUMBER(11),
  UPDATE_USER_ID  NUMBER(11),
  ORIGINAL_SKU_ID NUMBER(11),
  LAST_STATUS     NUMBER(1),
  MERCHANT_ID     NUMBER(11),
  SKU_TYPE        NUMBER(1),
  SALES           NUMBER(10),
  RES_CODE        VARCHAR2(300),
  PACK_ID         NUMBER(8)
)
;
comment on table EB_SKU
  is '��С���۵�Ԫ������ʵ����Ʒ��������Ʒ����ſ����׿������ѵȣ�
��Ҫ���ӵ��ֶΣ�
STOCK_INVENTORY_TYPE	��������ͣ�1��Ψһ��2�����ޡ�����������Ʒ������档������ѡ�� Ψһ�Ͳ��ޣ����Ψһ��Ե����ֻ���룬��治����Ե�������ҵ���ȵȣ��˴��뱣��δ����չ�ԡ�
TODO:';
comment on column EB_SKU.SKU_ID
  is '��С���۵�Ԫ����';
comment on column EB_SKU.SKU
  is '����';
comment on column EB_SKU.SKU_PRICE
  is '(�Էֱ�Ϊ��λ)�ۼۡ��ſ�Ԥ�滰�ѣ����м۸���ص��ֶ��޶�Ϊ9λ��Ч�������ڣ���1234567.89���൱��ǧ��Ԫ���ڣ�����ǰ���û���ʾʱ��С����Զ����2λ��������۸������ʾΪ.00��
��С��۸����2λС����ֱ�ӽص�2λС���ұߵ�С�����������룩����С��Ϊ1λ����1Ԫ9�ǣ�����ʾ1.90';
comment on column EB_SKU.SHOW_STATUS
  is '���¼�״̬��0.Ϊ�ϼܣ�1.Ϊ�¼�';
comment on column EB_SKU.STOCK_INVENTORY
  is '���';
comment on column EB_SKU.SKU_UPPER_LIMIT
  is '��������';
comment on column EB_SKU.LOCATION
  is '��λ���������������ַ���ת��';
comment on column EB_SKU.SKU_IMG
  is 'ͼƬ�洢λ�ã�1~5';
comment on column EB_SKU.SKU_SORT
  is 'ǰ̨��ʾ����';
comment on column EB_SKU.SKU_NAME
  is 'SKU���';
comment on column EB_SKU.MARKET_PRICE
  is '(�Էֱ�Ϊ��λ)�г��ۣ����м۸���ص��ֶ��޶�Ϊ9λ��Ч�������ڣ���1234567.89���൱��ǧ��Ԫ���ڣ�����ǰ���û���ʾʱ��С����Զ����2λ��������۸������ʾΪ.00����С��۸����2λС����ֱ�ӽص�2λС���ұߵ�С�����������룩����С��Ϊ1λ����1Ԫ9�ǣ�����ʾ1.90';
comment on column EB_SKU.LAST_STATUS
  is '0����ʷ��¼;1����';
comment on column EB_SKU.SKU_TYPE
  is '0Ϊ��Ʒ��1Ϊ��ͨSKU';
comment on column EB_SKU.RES_CODE
  is 'crm���ز����crm��ͨ���ն����';
comment on column EB_SKU.PACK_ID
  is 'crm���룬��Դ��id';
alter table EB_SKU
  add constraint PK_EB_SKU primary key (SKU_ID);

prompt
prompt Creating table EB_SKU_OFFER
prompt ===========================
prompt
create table EB_SKU_OFFER
(
  SKU_OFFER_ID   NUMBER(11) not null,
  OFFER_ID       NUMBER(11),
  SKU_ID         NUMBER(11),
  SKU_DISCOUNT   NUMBER(20,2),
  PURCHASE_PRICE NUMBER(20,2),
  PAYMENT_PRICE  NUMBER(20,2),
  PRODUCT_ID     VARCHAR2(20)
)
;
comment on table EB_SKU_OFFER
  is '�������ѡ����SKU';
comment on column EB_SKU_OFFER.OFFER_ID
  is '��������';
comment on column EB_SKU_OFFER.SKU_ID
  is '��С���۵�Ԫ����';
comment on column EB_SKU_OFFER.SKU_DISCOUNT
  is '�Żݶ�ڲ��Է�Ϊ��λ�����м۸���ص��ֶ��޶�Ϊ9λ��Ч�������ڣ���1234567.89���൱��ǧ��Ԫ���ڣ�����ǰ���û���ʾʱ��С����Զ����2λ��������۸������ʾΪ.00����С��۸����2λС����ֱ�ӽص�2λС���ұߵ�С�����������룩����С��Ϊ1λ����1Ԫ9�ǣ�����ʾ1.90';
comment on column EB_SKU_OFFER.PURCHASE_PRICE
  is '�����';
comment on column EB_SKU_OFFER.PAYMENT_PRICE
  is 'ʵ����';
alter table EB_SKU_OFFER
  add constraint PK_EB_SKU_OFFER primary key (SKU_OFFER_ID);

prompt
prompt Creating table EB_SLOT
prompt ======================
prompt
create table EB_SLOT
(
  SLOT_ID      NUMBER(11) not null,
  SLOT_NAME    VARCHAR2(80),
  SLOT_BELONG  NUMBER(11),
  SLOT_TYPE    NUMBER(2),
  SKU_QUANTITY NUMBER(2),
  SKU_PIC_SIZE VARCHAR2(40),
  AREA_ID      VARCHAR2(20 BYTE)
)
;
comment on column EB_SLOT.SLOT_ID
  is 'SOLT����';
comment on column EB_SLOT.SLOT_NAME
  is '��λ���';
comment on column EB_SLOT.SLOT_BELONG
  is '��λ����ҳ�棺1����ҳ��2���ֻ�ͨѶƵ��ҳ��3�������ն�Ƶ��ҳ��4���������Ƶ��ҳ��5����Ʒҳ�����ֶν�������չΪ����Թ���ҳ��?';
comment on column EB_SLOT.SLOT_TYPE
  is '��λ���ͣ�1���Ƽ���2�����ܣ�';
comment on column EB_SLOT.SKU_QUANTITY
  is '����ʾ����ƷSKU����';
comment on column EB_SLOT.SKU_PIC_SIZE
  is 'SKUͼƬ�����215��235';
comment on column EB_SLOT.AREA_ID
  is 'SLOT��������';
alter table EB_SLOT
  add constraint PK_EB_SLOT primary key (SLOT_ID);

prompt
prompt Creating table EB_SLOT_SKU
prompt ==========================
prompt
create table EB_SLOT_SKU
(
  SLOT_SKU_ID NUMBER(11) not null,
  SLOT_ID     NUMBER(11),
  SKU_ID      NUMBER(11),
  ITEM_ID     NUMBER(11),
  SKU_SORT    NUMBER(6),
  SALE_SKU    VARCHAR2(100)
)
;
comment on table EB_SLOT_SKU
  is '��λ����SKU������';
comment on column EB_SLOT_SKU.SLOT_SKU_ID
  is '��λSKU����������,�ݲ����ǰ�λ��SKU֮��Ĺ�����ϵ���˹�����������չ����֧��δ��ǰ�˾�̬ҳ���Ե�һ���SKUΪչʾ��ʽ';
comment on column EB_SLOT_SKU.SLOT_ID
  is '��λSKU����������';
comment on column EB_SLOT_SKU.SKU_ID
  is '��С���۵�Ԫ����';
comment on column EB_SLOT_SKU.ITEM_ID
  is '��Ʒ����';
comment on column EB_SLOT_SKU.SKU_SORT
  is 'SKU�ڰ�λ�е�����';
comment on column EB_SLOT_SKU.SALE_SKU
  is '������֧���������룬������ֵ֮����Ӣ���ַ�,���ָ�������������3�����ֵ��ÿ�����������22���ַ���';
alter table EB_SLOT_SKU
  add constraint PK_EB_SLOT_SKU primary key (SLOT_SKU_ID);

prompt
prompt Creating table EB_SMS_GROUP
prompt ===========================
prompt
create table EB_SMS_GROUP
(
  SERIAL_NO NUMBER(11) not null,
  GROUP_ID  NUMBER(3),
  PHONE     VARCHAR2(20)
)
;
comment on column EB_SMS_GROUP.GROUP_ID
  is '0-����δ�����ն��ţ�';
comment on column EB_SMS_GROUP.PHONE
  is '���ն��ŵ��ֻ����';
alter table EB_SMS_GROUP
  add constraint PK_EB_SMS_GROUP primary key (SERIAL_NO);

prompt
prompt Creating table EB_SPEC_VALUE
prompt ============================
prompt
create table EB_SPEC_VALUE
(
  SPEC_ID    NUMBER(11) not null,
  SKU_ID     NUMBER(11) not null,
  FEATURE_ID NUMBER(11) not null,
  SPEC_VALUE VARCHAR2(100) not null
)
;
comment on table EB_SPEC_VALUE
  is '���ֵ����۸��йأ�';
comment on column EB_SPEC_VALUE.SPEC_ID
  is '���ֵ����';
comment on column EB_SPEC_VALUE.SPEC_VALUE
  is '���ֵ';
alter table EB_SPEC_VALUE
  add constraint PK_EB_SPEC_VALUE primary key (SPEC_ID);

prompt
prompt Creating table EB_SUIT_ITEM
prompt ===========================
prompt
create table EB_SUIT_ITEM
(
  EB_SUIT_ITEM_ID   NUMBER(11) not null,
  EB_SUIT_ITEM_NAME VARCHAR2(200),
  EB_SUIT_ITEM_DESC VARCHAR2(4000),
  EB_SUIT_ITEM_SORT NUMBER(11),
  EB_SUIT_ITEM_TYPE NUMBER(2),
  GROUP_ID          NUMBER(11),
  GROUP_NAME        VARCHAR2(200),
  PRODUCT_CODE      VARCHAR2(200),
  IS_DELETED        NUMBER(2)
)
;
comment on column EB_SUIT_ITEM.EB_SUIT_ITEM_TYPE
  is 'ҵ�����ͣ�0: ��ѡ; 1: Ĭ��ѡ��; 2:Ĭ�ϲ�ѡ��';
comment on column EB_SUIT_ITEM.IS_DELETED
  is 'ɾ���־λ��0-ɾ�� 1-δɾ��';
alter table EB_SUIT_ITEM
  add constraint PK_EB_SUIT_ITEM primary key (EB_SUIT_ITEM_ID);

prompt
prompt Creating table EB_SUIT_ITEM_REL
prompt ===============================
prompt
create table EB_SUIT_ITEM_REL
(
  SIMCARD_SUIT_ID NUMBER(11),
  EB_SUIT_ITEM_ID NUMBER(11)
)
;

prompt
prompt Creating table EB_SUIT_VAS
prompt ==========================
prompt
create table EB_SUIT_VAS
(
  EB_SUIT_VAS_ID   NUMBER(11) not null,
  EB_SUIT_VAS_NAME VARCHAR2(200),
  EB_SUIT_VAS_TYPE NUMBER(2),
  EB_SUIT_VAS_DESC VARCHAR2(4000),
  EB_SUIT_VAS_SORT NUMBER(10),
  GROUP_ID         NUMBER(11),
  GROUP_NAME       VARCHAR2(200),
  OFFER_CODE       VARCHAR2(200),
  IS_DELETED       NUMBER(2)
)
;
comment on column EB_SUIT_VAS.EB_SUIT_VAS_TYPE
  is 'ҵ�����ͣ�0: ��ѡ; 1: Ĭ��ѡ��; 2:Ĭ�ϲ�ѡ��';
comment on column EB_SUIT_VAS.IS_DELETED
  is 'ɾ���־λ��0-ɾ�� 1-δɾ��';
alter table EB_SUIT_VAS
  add constraint PK_EB_SUIT_VAS primary key (EB_SUIT_VAS_ID);

prompt
prompt Creating table EB_SUIT_VAS_REL
prompt ==============================
prompt
create table EB_SUIT_VAS_REL
(
  SIMCARD_SUIT_ID NUMBER(11),
  EB_SUIT_VAS_ID  NUMBER(11)
)
;

prompt
prompt Creating table EB_SUPPLIER
prompt ==========================
prompt
create table EB_SUPPLIER
(
  SUPPLIER_ID    NUMBER(11) not null,
  USER_ID        NUMBER(11),
  SUPPLIER_NAME  VARCHAR2(80),
  FKA            VARCHAR2(80),
  LEGAL_REP      VARCHAR2(80),
  REG_CAP        VARCHAR2(40),
  CORP_TYPE      NUMBER(2),
  BIZ_SCOPE      VARCHAR2(400),
  LICENSE_NO     VARCHAR2(120),
  ESTABLISH_DATE VARCHAR2(20),
  CONTACT        VARCHAR2(80),
  MOBILE         VARCHAR2(50),
  FIXED_PHONE    VARCHAR2(80),
  FAX            VARCHAR2(80),
  EMAIL          VARCHAR2(120),
  WEBSITE        VARCHAR2(120),
  ADDRESS        VARCHAR2(80),
  ZIP            VARCHAR2(40),
  BANK_NAME      VARCHAR2(40),
  BANK_NO        VARCHAR2(60),
  BANK_ACCOUNT   VARCHAR2(80),
  TAX_NO         VARCHAR2(80),
  SUPPLY_TYPE    NUMBER(2),
  ATTACHMENT     VARCHAR2(400),
  IS_RECYCLED    NUMBER(1) default 0,
  CREATED_TIME   TIMESTAMP(6)
)
;
comment on table EB_SUPPLIER
  is '������';
comment on column EB_SUPPLIER.SUPPLIER_ID
  is '��Ӧ������';
comment on column EB_SUPPLIER.USER_ID
  is '��̨�û����������ڴ�����Ӧ��ʱΪ�䴴��һ����̨�û��˺ţ��������Ϲ�Ӧ�̽�ɫ';
comment on column EB_SUPPLIER.SUPPLIER_NAME
  is '��Ӧ�����';
comment on column EB_SUPPLIER.FKA
  is '������Formerly Known As';
comment on column EB_SUPPLIER.LEGAL_REP
  is '���˴��';
comment on column EB_SUPPLIER.REG_CAP
  is 'ע���ʱ������ı�ʾ10���ַ�����';
comment on column EB_SUPPLIER.CORP_TYPE
  is '��ҵ���ͣ�1������ҵ, 2������ҵ, 3˽Ӫ��ҵ, 4��Ӫ��ҵ, 5�������ι�˾, 6�ɷ����޹�˾, 7�ɷݺ�����ҵ, 8������ҵ, 9�ۡ��ġ�̨��Ͷ����ҵ, 10 ����Ͷ����ҵ';
comment on column EB_SUPPLIER.BIZ_SCOPE
  is '��Ӫ��Χ';
comment on column EB_SUPPLIER.LICENSE_NO
  is 'Ӫҵִ�պ�';
comment on column EB_SUPPLIER.ESTABLISH_DATE
  is '��������';
comment on column EB_SUPPLIER.CONTACT
  is '��ϵ��';
comment on column EB_SUPPLIER.MOBILE
  is '�ƶ��绰��11λ����';
comment on column EB_SUPPLIER.FIXED_PHONE
  is '�̶��绰����';
comment on column EB_SUPPLIER.FAX
  is '�������';
comment on column EB_SUPPLIER.EMAIL
  is '�����ʼ�';
comment on column EB_SUPPLIER.WEBSITE
  is '��ַ';
comment on column EB_SUPPLIER.ADDRESS
  is '��ַ';
comment on column EB_SUPPLIER.ZIP
  is '�ʱ�';
comment on column EB_SUPPLIER.BANK_NAME
  is '��������';
comment on column EB_SUPPLIER.BANK_NO
  is '�������б��';
comment on column EB_SUPPLIER.BANK_ACCOUNT
  is '�����˺�';
comment on column EB_SUPPLIER.TAX_NO
  is '��˰��';
comment on column EB_SUPPLIER.SUPPLY_TYPE
  is '�������ͣ����ṩ�Ļ�Ʒ�����ࣺ1�����2���ſ�';
comment on column EB_SUPPLIER.ATTACHMENT
  is '�ϴ��ļ��洢λ�ã���ʽ��Word��pdf��zip��rar��ѹ����';
comment on column EB_SUPPLIER.IS_RECYCLED
  is '�Ƿ�������վ��0����1����';
comment on column EB_SUPPLIER.CREATED_TIME
  is '��¼����ʱ��';
alter table EB_SUPPLIER
  add constraint PK_EB_SUPPLIER primary key (SUPPLIER_ID);

prompt
prompt Creating table EB_TAG
prompt =====================
prompt
create table EB_TAG
(
  TAG_ID        NUMBER(11) not null,
  TAG_NAME      VARCHAR2(60),
  REF_COUNTER   NUMBER(11),
  TOPIC_COUNTER NUMBER(11),
  STATUS        NUMBER(1),
  CREATE_TIME   TIMESTAMP(6),
  CREATOR       VARCHAR2(20)
)
;
comment on table EB_TAG
  is 'PMS��ǩ��';
comment on column EB_TAG.TAG_ID
  is '��ǩ����';
comment on column EB_TAG.TAG_NAME
  is '��ǩ���';
comment on column EB_TAG.REF_COUNTER
  is '��������';
comment on column EB_TAG.TOPIC_COUNTER
  is 'ר������';
comment on column EB_TAG.STATUS
  is '״̬';
comment on column EB_TAG.CREATE_TIME
  is '����ʱ��';
comment on column EB_TAG.CREATOR
  is '������';
alter table EB_TAG
  add constraint PK_EB_TAG primary key (TAG_ID);

prompt
prompt Creating table EB_TPLCAT
prompt ========================
prompt
create table EB_TPLCAT
(
  SERIAL_NO NUMBER(11) not null,
  CAT_ID    NUMBER(11) not null,
  SUIT_ID   NUMBER(11) not null,
  TPL_ID    NUMBER(11),
  TPL_TYPE  VARCHAR2(1)
)
;
comment on column EB_TPLCAT.SERIAL_NO
  is '����';
comment on column EB_TPLCAT.CAT_ID
  is '��ĿID';
comment on column EB_TPLCAT.SUIT_ID
  is '��װID';
comment on column EB_TPLCAT.TPL_ID
  is '��PMS_TEMPLATE������';
comment on column EB_TPLCAT.TPL_TYPE
  is 'ģ�����͡�1����Ŀ������Ŀ��ģ�壻2����Ʒ�������ݣ�ģ��';
alter table EB_TPLCAT
  add constraint PK_EBIZ_TPLCAT primary key (SERIAL_NO);

prompt
prompt Creating table EB_TPLOFFERGROUP
prompt ===============================
prompt
create table EB_TPLOFFERGROUP
(
  SERIAL_NO      NUMBER(11) not null,
  OFFER_GROUP_ID NUMBER(11) not null,
  SUIT_ID        NUMBER(11) not null,
  TPL_ID         NUMBER(11),
  TPL_TYPE       VARCHAR2(1)
)
;
comment on table EB_TPLOFFERGROUP
  is 'PMSģ���������ר�⣩�Ĺ����?';
comment on column EB_TPLOFFERGROUP.TPL_TYPE
  is 'ģ�����͡�3����������ר�⣩ģ��';
alter table EB_TPLOFFERGROUP
  add constraint PK_EBIZ_TPLOFFERGROUP primary key (SERIAL_NO);

prompt
prompt Creating table EB_TPLSLOT
prompt =========================
prompt
create table EB_TPLSLOT
(
  SERIAL_NO NUMBER(11) not null,
  SLOT_ID   NUMBER(11) not null,
  SUIT_ID   NUMBER(11) not null,
  DEPOLY_ID NUMBER(11),
  TPL_TYPE  VARCHAR2(1)
)
;
comment on column EB_TPLSLOT.SERIAL_NO
  is '����';
comment on column EB_TPLSLOT.SLOT_ID
  is '��λID';
comment on column EB_TPLSLOT.SUIT_ID
  is '��װID';
comment on column EB_TPLSLOT.DEPOLY_ID
  is '��PMS_TEMPLATE������';
comment on column EB_TPLSLOT.TPL_TYPE
  is 'ģ�����͡�1����Ŀ������Ŀ��ģ�壻2����Ʒ�������ݣ�ģ��';
alter table EB_TPLSLOT
  add constraint PK_EB_TPLSLOT primary key (SERIAL_NO);

prompt
prompt Creating table EB_TPL_ADLOCATION
prompt ================================
prompt
create table EB_TPL_ADLOCATION
(
  SERIAL_NO      NUMBER(11) not null,
  AD_LOCATION_ID NUMBER(11) not null,
  SUIT_ID        NUMBER(11) not null,
  TPL_ID         NUMBER(11),
  TPL_TYPE       VARCHAR2(1)
)
;
comment on column EB_TPL_ADLOCATION.SERIAL_NO
  is '����';
comment on column EB_TPL_ADLOCATION.AD_LOCATION_ID
  is '��λID';
comment on column EB_TPL_ADLOCATION.SUIT_ID
  is '��װID';
comment on column EB_TPL_ADLOCATION.TPL_ID
  is '��PMS_TEMPLATE������';
comment on column EB_TPL_ADLOCATION.TPL_TYPE
  is 'ģ�����͡�1����Ŀ������Ŀ��ģ�壻2����Ʒ�������ݣ�ģ��';
alter table EB_TPL_ADLOCATION
  add constraint PK_EB_TPL_ADLOCATION primary key (SERIAL_NO);

prompt
prompt Creating table EB_VIEW_LIST
prompt ===========================
prompt
create table EB_VIEW_LIST
(
  ID             NUMBER(11),
  CAT_ID         NUMBER(11),
  CAT_INFO       VARCHAR2(1000),
  REL_ID         NUMBER(11),
  REL_INFO       NUMBER(11),
  VIEW_LIST_TYPE NUMBER(2)
)
;

prompt
prompt Creating table EB_VIEW_SKUVIEW
prompt ==============================
prompt
create table EB_VIEW_SKUVIEW
(
  ID       NUMBER(11),
  SKU_ID   NUMBER(11),
  SKU_INFO VARCHAR2(1000),
  ITEM_ID  NUMBER(11),
  CAT_ID   NUMBER(11),
  OFFER_ID NUMBER(11),
  BRAND_ID NUMBER(11)
)
;

prompt
prompt Creating table JBPM4_DEPLOYMENT
prompt ===============================
prompt
create table JBPM4_DEPLOYMENT
(
  DBID_      NUMBER(19) not null,
  NAME_      CLOB,
  TIMESTAMP_ NUMBER(19),
  STATE_     VARCHAR2(255)
)
;
alter table JBPM4_DEPLOYMENT
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_DEPLOYPROP
prompt ===============================
prompt
create table JBPM4_DEPLOYPROP
(
  DBID_       NUMBER(19) not null,
  DEPLOYMENT_ NUMBER(19),
  OBJNAME_    VARCHAR2(255),
  KEY_        VARCHAR2(255),
  STRINGVAL_  VARCHAR2(255),
  LONGVAL_    NUMBER(19)
)
;
alter table JBPM4_DEPLOYPROP
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_EXECUTION
prompt ==============================
prompt
create table JBPM4_EXECUTION
(
  DBID_          NUMBER(19) not null,
  CLASS_         VARCHAR2(255) not null,
  DBVERSION_     NUMBER(10) not null,
  ACTIVITYNAME_  VARCHAR2(255),
  PROCDEFID_     VARCHAR2(255),
  HASVARS_       NUMBER(1),
  NAME_          VARCHAR2(255),
  KEY_           VARCHAR2(255),
  ID_            VARCHAR2(255),
  STATE_         VARCHAR2(255),
  SUSPHISTSTATE_ VARCHAR2(255),
  PRIORITY_      NUMBER(10),
  HISACTINST_    NUMBER(19),
  PARENT_        NUMBER(19),
  INSTANCE_      NUMBER(19),
  SUPEREXEC_     NUMBER(19),
  SUBPROCINST_   NUMBER(19),
  PARENT_IDX_    NUMBER(10)
)
;
alter table JBPM4_EXECUTION
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_HIST_ACTINST
prompt =================================
prompt
create table JBPM4_HIST_ACTINST
(
  DBID_          NUMBER(19) not null,
  CLASS_         VARCHAR2(255) not null,
  DBVERSION_     NUMBER(10) not null,
  HPROCI_        NUMBER(19),
  TYPE_          VARCHAR2(255),
  EXECUTION_     VARCHAR2(255),
  ACTIVITY_NAME_ VARCHAR2(255),
  START_         TIMESTAMP(6),
  END_           TIMESTAMP(6),
  DURATION_      NUMBER(19),
  TRANSITION_    VARCHAR2(255),
  NEXTIDX_       NUMBER(10),
  HTASK_         NUMBER(19)
)
;
alter table JBPM4_HIST_ACTINST
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_HIST_DETAIL
prompt ================================
prompt
create table JBPM4_HIST_DETAIL
(
  DBID_       NUMBER(19) not null,
  CLASS_      VARCHAR2(255) not null,
  DBVERSION_  NUMBER(10) not null,
  USERID_     VARCHAR2(255),
  TIME_       TIMESTAMP(6),
  HPROCI_     NUMBER(19),
  HPROCIIDX_  NUMBER(10),
  HACTI_      NUMBER(19),
  HACTIIDX_   NUMBER(10),
  HTASK_      NUMBER(19),
  HTASKIDX_   NUMBER(10),
  HVAR_       NUMBER(19),
  HVARIDX_    NUMBER(10),
  MESSAGE_    CLOB,
  OLD_STR_    VARCHAR2(255),
  NEW_STR_    VARCHAR2(255),
  OLD_INT_    NUMBER(10),
  NEW_INT_    NUMBER(10),
  OLD_TIME_   TIMESTAMP(6),
  NEW_TIME_   TIMESTAMP(6),
  PARENT_     NUMBER(19),
  PARENT_IDX_ NUMBER(10)
)
;
alter table JBPM4_HIST_DETAIL
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_HIST_PROCINST
prompt ==================================
prompt
create table JBPM4_HIST_PROCINST
(
  DBID_        NUMBER(19) not null,
  DBVERSION_   NUMBER(10) not null,
  ID_          VARCHAR2(255),
  PROCDEFID_   VARCHAR2(255),
  KEY_         VARCHAR2(255),
  START_       TIMESTAMP(6),
  END_         TIMESTAMP(6),
  DURATION_    NUMBER(19),
  STATE_       VARCHAR2(255),
  ENDACTIVITY_ VARCHAR2(255),
  NEXTIDX_     NUMBER(10)
)
;
alter table JBPM4_HIST_PROCINST
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_HIST_TASK
prompt ==============================
prompt
create table JBPM4_HIST_TASK
(
  DBID_      NUMBER(19) not null,
  DBVERSION_ NUMBER(10) not null,
  EXECUTION_ VARCHAR2(255),
  OUTCOME_   VARCHAR2(255),
  ASSIGNEE_  VARCHAR2(255),
  PRIORITY_  NUMBER(10),
  STATE_     VARCHAR2(255),
  CREATE_    TIMESTAMP(6),
  END_       TIMESTAMP(6),
  DURATION_  NUMBER(19),
  NEXTIDX_   NUMBER(10),
  SUPERTASK_ NUMBER(19)
)
;
alter table JBPM4_HIST_TASK
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_HIST_VAR
prompt =============================
prompt
create table JBPM4_HIST_VAR
(
  DBID_        NUMBER(19) not null,
  DBVERSION_   NUMBER(10) not null,
  PROCINSTID_  VARCHAR2(255),
  EXECUTIONID_ VARCHAR2(255),
  VARNAME_     VARCHAR2(255),
  VALUE_       VARCHAR2(255),
  HPROCI_      NUMBER(19),
  HTASK_       NUMBER(19)
)
;
alter table JBPM4_HIST_VAR
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_ID_GROUP
prompt =============================
prompt
create table JBPM4_ID_GROUP
(
  DBID_      NUMBER(19) not null,
  DBVERSION_ NUMBER(10) not null,
  ID_        VARCHAR2(255),
  NAME_      VARCHAR2(255),
  TYPE_      VARCHAR2(255),
  PARENT_    NUMBER(19)
)
;
alter table JBPM4_ID_GROUP
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_ID_MEMBERSHIP
prompt ==================================
prompt
create table JBPM4_ID_MEMBERSHIP
(
  DBID_      NUMBER(19) not null,
  DBVERSION_ NUMBER(10) not null,
  USER_      NUMBER(19),
  GROUP_     NUMBER(19),
  NAME_      VARCHAR2(255)
)
;
alter table JBPM4_ID_MEMBERSHIP
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_ID_USER
prompt ============================
prompt
create table JBPM4_ID_USER
(
  DBID_          NUMBER(19) not null,
  DBVERSION_     NUMBER(10) not null,
  ID_            VARCHAR2(255),
  PASSWORD_      VARCHAR2(255),
  GIVENNAME_     VARCHAR2(255),
  FAMILYNAME_    VARCHAR2(255),
  BUSINESSEMAIL_ VARCHAR2(255)
)
;
alter table JBPM4_ID_USER
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_JOB
prompt ========================
prompt
create table JBPM4_JOB
(
  DBID_            NUMBER(19) not null,
  CLASS_           VARCHAR2(255) not null,
  DBVERSION_       NUMBER(10) not null,
  DUEDATE_         TIMESTAMP(6),
  STATE_           VARCHAR2(255),
  ISEXCLUSIVE_     NUMBER(1),
  LOCKOWNER_       VARCHAR2(255),
  LOCKEXPTIME_     TIMESTAMP(6),
  EXCEPTION_       CLOB,
  RETRIES_         NUMBER(10),
  PROCESSINSTANCE_ NUMBER(19),
  EXECUTION_       NUMBER(19),
  CFG_             NUMBER(19),
  SIGNAL_          VARCHAR2(255),
  EVENT_           VARCHAR2(255),
  REPEAT_          VARCHAR2(255)
)
;
alter table JBPM4_JOB
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_LOB
prompt ========================
prompt
create table JBPM4_LOB
(
  DBID_       NUMBER(19) not null,
  DBVERSION_  NUMBER(10) not null,
  BLOB_VALUE_ BLOB,
  DEPLOYMENT_ NUMBER(19),
  NAME_       CLOB
)
;
alter table JBPM4_LOB
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_PARTICIPATION
prompt ==================================
prompt
create table JBPM4_PARTICIPATION
(
  DBID_      NUMBER(19) not null,
  DBVERSION_ NUMBER(10) not null,
  GROUPID_   VARCHAR2(255),
  USERID_    VARCHAR2(255),
  TYPE_      VARCHAR2(255),
  TASK_      NUMBER(19),
  SWIMLANE_  NUMBER(19)
)
;
alter table JBPM4_PARTICIPATION
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_PROPERTY
prompt =============================
prompt
create table JBPM4_PROPERTY
(
  KEY_     VARCHAR2(255) not null,
  VERSION_ NUMBER(10) not null,
  VALUE_   VARCHAR2(255)
)
;
alter table JBPM4_PROPERTY
  add primary key (KEY_);

prompt
prompt Creating table JBPM4_SWIMLANE
prompt =============================
prompt
create table JBPM4_SWIMLANE
(
  DBID_      NUMBER(19) not null,
  DBVERSION_ NUMBER(10) not null,
  NAME_      VARCHAR2(255),
  ASSIGNEE_  VARCHAR2(255),
  EXECUTION_ NUMBER(19)
)
;
alter table JBPM4_SWIMLANE
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_TASK
prompt =========================
prompt
create table JBPM4_TASK
(
  DBID_          NUMBER(19) not null,
  CLASS_         CHAR(1) not null,
  DBVERSION_     NUMBER(10) not null,
  NAME_          VARCHAR2(255),
  DESCR_         CLOB,
  STATE_         VARCHAR2(255),
  SUSPHISTSTATE_ VARCHAR2(255),
  ASSIGNEE_      VARCHAR2(255),
  FORM_          VARCHAR2(255),
  PRIORITY_      NUMBER(10),
  CREATE_        TIMESTAMP(6),
  DUEDATE_       TIMESTAMP(6),
  PROGRESS_      NUMBER(10),
  SIGNALLING_    NUMBER(1),
  EXECUTION_ID_  VARCHAR2(255),
  ACTIVITY_NAME_ VARCHAR2(255),
  HASVARS_       NUMBER(1),
  SUPERTASK_     NUMBER(19),
  EXECUTION_     NUMBER(19),
  PROCINST_      NUMBER(19),
  SWIMLANE_      NUMBER(19),
  TASKDEFNAME_   VARCHAR2(255)
)
;
alter table JBPM4_TASK
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_VARIABLE
prompt =============================
prompt
create table JBPM4_VARIABLE
(
  DBID_         NUMBER(19) not null,
  CLASS_        VARCHAR2(255) not null,
  DBVERSION_    NUMBER(10) not null,
  KEY_          VARCHAR2(255),
  CONVERTER_    VARCHAR2(255),
  HIST_         NUMBER(1),
  EXECUTION_    NUMBER(19),
  TASK_         NUMBER(19),
  LOB_          NUMBER(19),
  DATE_VALUE_   TIMESTAMP(6),
  DOUBLE_VALUE_ FLOAT,
  CLASSNAME_    VARCHAR2(255),
  LONG_VALUE_   NUMBER(19),
  STRING_VALUE_ VARCHAR2(255),
  TEXT_VALUE_   CLOB,
  EXESYS_       NUMBER(19)
)
;
alter table JBPM4_VARIABLE
  add primary key (DBID_);

prompt
prompt Creating table JBPM_ROLE
prompt ========================
prompt
create table JBPM_ROLE
(
  ROLE_ID   NUMBER(10) not null,
  PERM_ID   NUMBER(11),
  ROLE_NAME VARCHAR2(50),
  MEMO      VARCHAR2(100)
)
;
alter table JBPM_ROLE
  add constraint PK_JBPM_ROLE primary key (ROLE_ID);

prompt
prompt Creating table PMS_ADVERTISEMENT
prompt ================================
prompt
create table PMS_ADVERTISEMENT
(
  AD_ID           NUMBER(11) not null,
  AD_NAME         VARCHAR2(80),
  AD_DESCRIPTION  VARCHAR2(1000),
  AD_TYPE         NUMBER(1),
  AD_WORDS        VARCHAR2(1000),
  AD_IMG          VARCHAR2(500),
  AD_PICTURES     VARCHAR2(2000),
  AD_FLASH        VARCHAR2(2000),
  AD_CAROUSELTIME NUMBER(5),
  AD_STATUS       NUMBER(1),
  AD_LINK         VARCHAR2(200),
  CREATOR         NUMBER(11),
  CREATE_TIME     TIMESTAMP(6),
  UPDATE_TIME     TIMESTAMP(6)
)
;
alter table PMS_ADVERTISEMENT
  add constraint PK_PMS_ADVERTISEMENT primary key (AD_ID);

prompt
prompt Creating table PMS_AD_LOCATION
prompt ==============================
prompt
create table PMS_AD_LOCATION
(
  LOCATION_ID           NUMBER(11) not null,
  LOCATION_NAME         VARCHAR2(80),
  LOCATION_DESCRIPTIONS VARCHAR2(1000),
  LOCATION_WIDTH        NUMBER(5),
  LOCATION_HIGH         NUMBER(5),
  LOCATION_CODE         VARCHAR2(3000),
  CREATOR               NUMBER(11),
  CREATE_TIME           TIMESTAMP(6),
  UPDATE_TIME           TIMESTAMP(6)
)
;
alter table PMS_AD_LOCATION
  add constraint PK_PMS_AD_LOCATION primary key (LOCATION_ID);

prompt
prompt Creating table PMS_AD_LOCATION_LINK
prompt ===================================
prompt
create table PMS_AD_LOCATION_LINK
(
  AD_ID       NUMBER(11) not null,
  LOCATION_ID NUMBER(11) not null,
  STATUS      NUMBER(1)
)
;
alter table PMS_AD_LOCATION_LINK
  add constraint PK_PMS_AD_LOCATION_LINK primary key (AD_ID, LOCATION_ID);

prompt
prompt Creating table PMS_ATTACHMENT_CONFIG
prompt ====================================
prompt
create table PMS_ATTACHMENT_CONFIG
(
  FILE_ID                  NUMBER(1) not null,
  FILE_SIZE                NUMBER(10),
  FILE_TYPE                VARCHAR2(200),
  FILE_MARK_PIC_MODE       NUMBER(1),
  FILE_MARK_CHAR_MODE      NUMBER(1),
  FILE_MARK_PIC_PATH       VARCHAR2(100),
  FILE_MARK_PIC_QUALITY    NUMBER(10),
  FILE_MARK_PIC_ALPHA      NUMBER(10),
  FILE_MARK_PIC_SIZE_WIDTH NUMBER(10),
  FILE_MARK_PIC_SIZE_HEIGH NUMBER(10),
  FILE_MARK_CHAR_CONTENT   VARCHAR2(20),
  FILE_MARK_CHAR_SIZE      NUMBER(10),
  FILE_MARK_CHAR_COLOR     VARCHAR2(10),
  FILE_MARK_POSITION       NUMBER(2),
  FILE_CUT_PIC_MIN_WIDTH   NUMBER(10),
  FILE_CUT_PIC_MIN_HEIGH   NUMBER(10)
)
;
alter table PMS_ATTACHMENT_CONFIG
  add constraint PK_PMS_ATTACHMENT_CONFIG primary key (FILE_ID);

prompt
prompt Creating table PMS_BACKLANDLOG
prompt ==============================
prompt
create table PMS_BACKLANDLOG
(
  LANDLOG_ID         NUMBER(11) not null,
  LANDLOG_USER_NAME  VARCHAR2(40),
  LANDLOG_TIME       TIMESTAMP(6),
  LANDLOG_IP_ADDRESS VARCHAR2(50)
)
;
alter table PMS_BACKLANDLOG
  add constraint PK_PMS_BACKLANDLOG primary key (LANDLOG_ID);

prompt
prompt Creating table PMS_BACKLOG
prompt ==========================
prompt
create table PMS_BACKLOG
(
  LOG_ID            NUMBER(11) not null,
  LOG_FUNCTION_NAME VARCHAR2(40),
  LOG_OPERATE_NAME  VARCHAR2(40),
  LOG_OPERATE_TIME  TIMESTAMP(6),
  LOG_USER_NAME     VARCHAR2(40),
  LOG_IP_ADDRESS    VARCHAR2(50),
  LOG_MEMO          VARCHAR2(100),
  LOG_DETAILS       VARCHAR2(4000)
)
;
alter table PMS_BACKLOG
  add constraint PK_PMS_BACKLOG primary key (LOG_ID);

prompt
prompt Creating table PMS_CHANNEL
prompt ==========================
prompt
create table PMS_CHANNEL
(
  CHANNEL_ID   NUMBER(11) not null,
  UPCHANNEL_ID NUMBER(11),
  PID          VARCHAR2(100),
  CHANNEL_NAME VARCHAR2(100),
  MODEL_ID     NUMBER(11),
  CHANNEL_PATH VARCHAR2(30),
  PRIORITY     NUMBER(5),
  TITLE_IMG    VARCHAR2(300),
  CONTENT_IMG  VARCHAR2(300),
  DESCRIPTION  CLOB,
  META_TITLE   VARCHAR2(120),
  META_KEYWORD VARCHAR2(200),
  META_NOTE    VARCHAR2(400),
  OPEN_TYPE    NUMBER(1),
  ADDR_LINK    VARCHAR2(200),
  STATUS       NUMBER(1),
  DEL_YN       NUMBER(1),
  CREATOR      NUMBER(11),
  CREATETIME   TIMESTAMP(6),
  UPDATETIME   TIMESTAMP(6)
)
;
alter table PMS_CHANNEL
  add constraint PK_PMS_CHANNEL primary key (CHANNEL_ID);

prompt
prompt Creating table PMS_CONTENT
prompt ==========================
prompt
create table PMS_CONTENT
(
  CONTENT_ID    NUMBER(11) not null,
  CHANNEL_ID    NUMBER(11),
  MODEL_ID      NUMBER(11),
  TITLE         VARCHAR2(200),
  SHORT_TITLE   VARCHAR2(200),
  TITLE_IMG     VARCHAR2(300),
  CONTENT_IMG   VARCHAR2(300),
  TYPE_IMG      VARCHAR2(300),
  ABSTRACT_INFO VARCHAR2(800),
  AUTHOR        VARCHAR2(100),
  RES_NAME      VARCHAR2(100),
  RES_ADDR      VARCHAR2(300),
  TYPE_ID       NUMBER(11),
  CONTENT       CLOB,
  IS_KEYWORDS   NUMBER(1),
  UP_LEVEL      NUMBER(2),
  RECOMMEND     NUMBER(1),
  CONTENTNEW    NUMBER(1),
  PICTURES      VARCHAR2(3000),
  ATTACHMENT    VARCHAR2(3000),
  MEDIA         VARCHAR2(3000),
  MARK_YN       NUMBER(1),
  STATUS        NUMBER(1),
  CHECK_REASON  VARCHAR2(100),
  CHECKER_ID    NUMBER(11),
  CHECKTIME     TIMESTAMP(6),
  DEL_YN        NUMBER(1),
  DEL_MAN       NUMBER(11),
  DEL_TIME      TIMESTAMP(6),
  CREATOR       NUMBER(11),
  CREATETIME    TIMESTAMP(6),
  UPDATETIME    TIMESTAMP(6)
)
;
alter table PMS_CONTENT
  add constraint PK_PMS_CONTENT primary key (CONTENT_ID);

prompt
prompt Creating table PMS_CONTENTBAK
prompt =============================
prompt
create table PMS_CONTENTBAK
(
  CONTENT_HIS_ID NUMBER(11) not null,
  CONTENT_ID     NUMBER(11),
  CHANNEL_ID     NUMBER(11),
  MODEL_ID       NUMBER(11),
  TITLE          VARCHAR2(200),
  SHORT_TITLE    VARCHAR2(200),
  TITLE_IMG      VARCHAR2(300),
  CONTENT_IMG    VARCHAR2(300),
  TYPE_IMG       VARCHAR2(300),
  ABSTRACT_INFO  VARCHAR2(800),
  AUTHOR         VARCHAR2(100),
  RES_NAME       VARCHAR2(100),
  RES_ADDR       VARCHAR2(300),
  TYPE_ID        NUMBER(11),
  CONTENT        CLOB,
  IS_KEYWORDS    NUMBER(1),
  UP_LEVEL       NUMBER(2),
  RECOMMEND      NUMBER(1),
  CONTENTNEW     NUMBER(1),
  PICTURES       VARCHAR2(3000),
  ATTACHMENT     VARCHAR2(3000),
  MEDIA          VARCHAR2(3000),
  MARK_YN        NUMBER(1),
  STATUS         NUMBER(1),
  CHECKTIME      TIMESTAMP(6),
  CHECKER_ID     NUMBER(11),
  DEL_YN         NUMBER(1),
  APPLY_YN       NUMBER(1),
  NEW_YN         NUMBER(1),
  APPLYTIME      TIMESTAMP(6),
  CREATOR        NUMBER(11),
  CREATETIME     TIMESTAMP(6),
  UPDATETIME     TIMESTAMP(6)
)
;
alter table PMS_CONTENTBAK
  add constraint PK_PMS_CONTENTBAK primary key (CONTENT_HIS_ID);

prompt
prompt Creating table PMS_CONTENT_SHARE
prompt ================================
prompt
create table PMS_CONTENT_SHARE
(
  SERAIL_NO  NUMBER(11) not null,
  SHARE_NAME VARCHAR2(20),
  SHARE_URL  VARCHAR2(1000),
  PIC_URL    VARCHAR2(300),
  PRIORITY   NUMBER(5),
  STATUS     NUMBER(1),
  CREATETIME TIMESTAMP(6)
)
;
alter table PMS_CONTENT_SHARE
  add constraint PK_PMS_CONTENT_SHARE primary key (SERAIL_NO);

prompt
prompt Creating table PMS_CONTENT_TAG
prompt ==============================
prompt
create table PMS_CONTENT_TAG
(
  SERIAL_NO  NUMBER(11) not null,
  TAG_ID     NUMBER(11),
  CONTENT_ID NUMBER(11)
)
;
alter table PMS_CONTENT_TAG
  add constraint PK_PMS_CONTENT_TAG primary key (SERIAL_NO);

prompt
prompt Creating table PMS_CONTENT_TYPE
prompt ===============================
prompt
create table PMS_CONTENT_TYPE
(
  TYPE_ID    NUMBER(11) not null,
  TYPE_NAME  VARCHAR2(60),
  IMG_WIDTH  NUMBER(11),
  IMG_HEIGHT NUMBER(11),
  HAS_IMAGE  NUMBER(1),
  STATUS     NUMBER(1)
)
;
alter table PMS_CONTENT_TYPE
  add constraint PK_PMS_CONTENT_TYPE primary key (TYPE_ID);

prompt
prompt Creating table PMS_HELPTIP
prompt ==========================
prompt
create table PMS_HELPTIP
(
  HELPTIP_ID   NUMBER(11) not null,
  USER_ID      NUMBER(11),
  MODULE_NAME  VARCHAR2(80),
  MODULE_AILAS VARCHAR2(80),
  STATUS       NUMBER(1)
)
;
alter table PMS_HELPTIP
  add constraint PK_PMS_HELPTIP primary key (HELPTIP_ID);

prompt
prompt Creating table PMS_KEYWORD
prompt ==========================
prompt
create table PMS_KEYWORD
(
  KEYWORD_ID      NUMBER(11) not null,
  KEYWORD_NAME    VARCHAR2(100),
  REPLACE_CONTENT VARCHAR2(255),
  STATUS          NUMBER(1),
  CREATE_TIME     TIMESTAMP(6),
  CREATOR         VARCHAR2(20),
  REPLACE_TYPE    NUMBER(1),
  EXTERNAL_LINK   VARCHAR2(300)
)
;
alter table PMS_KEYWORD
  add constraint PK_PMS_KEYWORD primary key (KEYWORD_ID);

prompt
prompt Creating table PMS_MAIL
prompt =======================
prompt
create table PMS_MAIL
(
  ID             NUMBER(1) not null,
  SOURCE_ADDRESS VARCHAR2(100),
  MAIL_SERVER    VARCHAR2(100),
  USERNAME       VARCHAR2(50),
  PASSWORD       VARCHAR2(50),
  MAIL_SUBJECT   VARCHAR2(100),
  SEND_NAME      VARCHAR2(100)
)
;
alter table PMS_MAIL
  add constraint PK_PMS_MAIL primary key (ID);

prompt
prompt Creating table PMS_MEMBER
prompt =========================
prompt
create table PMS_MEMBER
(
  MEMBER_ID     NUMBER(11) not null,
  MEMBER_NAME   VARCHAR2(60),
  EMAIL         VARCHAR2(100),
  PASSWORD      VARCHAR2(100),
  GROUP_ID      NUMBER(11),
  REAL_NAME     VARCHAR2(60),
  GENDER        NUMBER(1),
  BIRTHDAY      VARCHAR2(20),
  ADDRESS       VARCHAR2(300),
  QQ_NUM        VARCHAR2(20),
  MSN_NUM       VARCHAR2(50),
  PHONE         VARCHAR2(20),
  CELLPHONE     VARCHAR2(20),
  INTRO_INFO    VARCHAR2(1500),
  STATUS        NUMBER(1),
  LOGIN_COUNT   NUMBER(11),
  REGISTER_TIME TIMESTAMP(6),
  LOGIN_TIME    TIMESTAMP(6)
)
;
alter table PMS_MEMBER
  add constraint PK_PMS_MEMBER primary key (MEMBER_ID);

prompt
prompt Creating table PMS_MEMBER_CONFIG
prompt ================================
prompt
create table PMS_MEMBER_CONFIG
(
  MEMBER_ID         NUMBER(1) not null,
  MEMBER_OPTION     NUMBER(1),
  MEMBER_REG_OPTION NUMBER(1),
  MEMBER_NAME_MIN   NUMBER(10),
  MEMBER_PASS_MIN   NUMBER(10),
  MEMBER_RESERVE    VARCHAR2(60),
  MEMBER_NAME_MAX   NUMBER(10),
  MEMBER_PASS_MAX   NUMBER(10)
)
;
alter table PMS_MEMBER_CONFIG
  add constraint PK_PMS_MEMBER_CONFIG primary key (MEMBER_ID);

prompt
prompt Creating table PMS_MEMBER_GROUP
prompt ===============================
prompt
create table PMS_MEMBER_GROUP
(
  GROUP_ID      NUMBER(11) not null,
  GROUP_NAME    VARCHAR2(60),
  PRIORITY      NUMBER(5),
  DEFAULT_GROUP NUMBER(1),
  INIT_GROUP    NUMBER(1)
)
;
alter table PMS_MEMBER_GROUP
  add constraint PK_PMS_MEMBER_GROUP primary key (GROUP_ID);

prompt
prompt Creating table PMS_MESSAGE
prompt ==========================
prompt
create table PMS_MESSAGE
(
  MESSAGE_ID       NUMBER(11) not null,
  MESSAGE_TITLE    VARCHAR2(200),
  MESSAGE_TYPE     NUMBER(11),
  MESSAGE_CONTENT  VARCHAR2(2000),
  REVERT_CONTENT   VARCHAR2(2000),
  REVERT_TIME      TIMESTAMP(6),
  STATUS           NUMBER(1),
  CHECK_REASON     VARCHAR2(100),
  DEL_YN           NUMBER(1),
  MESSAGE_MAN_ID   NUMBER(11),
  MESSAGE_MAN_NAME VARCHAR2(60),
  MESSAGE_TIME     TIMESTAMP(6)
)
;
alter table PMS_MESSAGE
  add constraint PK_PMS_MESSAGE primary key (MESSAGE_ID);

prompt
prompt Creating table PMS_MESSAGE_TYPE
prompt ===============================
prompt
create table PMS_MESSAGE_TYPE
(
  MESSAGE_TYPE_ID   NUMBER(11) not null,
  MESSAGE_TYPE_NAME VARCHAR2(100),
  PRIORITY          NUMBER(5),
  DEFAULT_YN        NUMBER(1),
  MESSAGE_NOTE      VARCHAR2(500)
)
;
alter table PMS_MESSAGE_TYPE
  add constraint PK_PMS_MESSAGE_TYPE primary key (MESSAGE_TYPE_ID);

prompt
prompt Creating table PMS_MODEL
prompt ========================
prompt
create table PMS_MODEL
(
  MODEL_ID    NUMBER(6) not null,
  MODEL_NAME  VARCHAR2(100),
  MODEL_TYPE  VARCHAR2(1),
  PRIORITY    NUMBER(5),
  HAS_CONTENT NUMBER(1),
  STATUS      NUMBER(1)
)
;
alter table PMS_MODEL
  add constraint PK_PMS_MODEL primary key (MODEL_ID);

prompt
prompt Creating table PMS_MODELITEM
prompt ============================
prompt
create table PMS_MODELITEM
(
  MODELITEM_ID   NUMBER(11) not null,
  MODEL_ID       NUMBER(11),
  FIELD          VARCHAR2(50),
  ITEM_LABEL     VARCHAR2(100),
  DATA_TYPE      NUMBER(2),
  DATA_LENGTH    VARCHAR2(30),
  PRIORITY       NUMBER(5),
  STATUS         NUMBER(1),
  DEF_VALUE      VARCHAR2(300),
  OPT_VALUE      VARCHAR2(300),
  TEXT_WIDTH     NUMBER(3),
  AREA_ROWS      NUMBER(3),
  AREA_COLS      NUMBER(3),
  HELP_INFO      VARCHAR2(300),
  CHECK_RULE     VARCHAR2(2),
  CHECK_EXP      VARCHAR2(500),
  ERROR_INFO     VARCHAR2(200),
  SELECT_TAB     VARCHAR2(2),
  MODELITEM_TYPE NUMBER(1),
  IS_SELFDEFINE  NUMBER(1),
  IS_REQUIRED    NUMBER(1)
)
;
alter table PMS_MODELITEM
  add constraint PK_JC_MODEL_ITEM primary key (MODELITEM_ID);

prompt
prompt Creating table PMS_PERMISSION
prompt =============================
prompt
create table PMS_PERMISSION
(
  PERM_ID    NUMBER(11) not null,
  PERM_UPID  NUMBER(11),
  PERM_TYPE  NUMBER(1),
  PERM_NAME  VARCHAR2(100),
  PERM_URL   VARCHAR2(100),
  PERM_USE   NUMBER(1),
  PERM_ORDER NUMBER(3),
  PERM_NOTE  VARCHAR2(100)
)
;
alter table PMS_PERMISSION
  add constraint PK_PMS_PERMISSION primary key (PERM_ID);

prompt
prompt Creating table PMS_PREDEPLOY
prompt ============================
prompt
create table PMS_PREDEPLOY
(
  SERIAL_NO NUMBER(11) not null,
  STATUS    NUMBER(1),
  STARTTIME TIMESTAMP(6),
  ENDTIME   TIMESTAMP(6),
  DEPLOY_ID NUMBER(11)
)
;
alter table PMS_PREDEPLOY
  add constraint PK_PMS_PREDEPLOY primary key (SERIAL_NO);

prompt
prompt Creating table PMS_RESOURCE
prompt ===========================
prompt
create table PMS_RESOURCE
(
  RESOURCE_ID      NUMBER(11) not null,
  RESOURCE_NAME    VARCHAR2(100),
  UPRESOURCE_ID    NUMBER(11),
  RESOURCE_TYPE    NUMBER(1),
  RESOURCE_POSTFIX VARCHAR2(200),
  RESOURCE_SIZE    NUMBER(8),
  RESOURCE_PATH    VARCHAR2(200),
  RESOURCE_NOTE    VARCHAR2(500),
  CREATOR          NUMBER(11),
  CREATETIME       TIMESTAMP(6),
  MODIFIER         NUMBER(11),
  MODIFYTIME       TIMESTAMP(6)
)
;
alter table PMS_RESOURCE
  add constraint PK_PMS_RESOURCE primary key (RESOURCE_ID);

prompt
prompt Creating table PMS_ROLEPERM
prompt ===========================
prompt
create table PMS_ROLEPERM
(
  SERIAL_NO NUMBER(11) not null,
  PERM_ID   NUMBER(11),
  ROLE_ID   NUMBER(11),
  T_TYPE    NUMBER(1)
)
;
alter table PMS_ROLEPERM
  add constraint PK_PMS_ROLEPERM primary key (SERIAL_NO);

prompt
prompt Creating table PMS_SAFETY_CONFIG
prompt ================================
prompt
create table PMS_SAFETY_CONFIG
(
  SAFETY_ID                  NUMBER(2) not null,
  SAFETY_MAX_RESULT          VARCHAR2(20),
  SAFETY_SEARCH_MIN          NUMBER(5),
  SAFETY_SEARCH_MAX          NUMBER(5),
  SAFETY_SESSION_TIME        NUMBER(10),
  SAFETY_LOGIN_LOG           NUMBER(1),
  SAFETY_OPERATE_LOG         NUMBER(1),
  SAFETY_ABSTRACT_LENGTH     VARCHAR2(20),
  SAFETY_BACKUP_PATH         VARCHAR2(200),
  SAFETY_STATIC_PAGE_SUFFIX  VARCHAR2(10),
  SAFETY_DYNAMIC_PAGE_SUFFIX VARCHAR2(10)
)
;
alter table PMS_SAFETY_CONFIG
  add constraint PK_PMS_SAFETY_CONFIG primary key (SAFETY_ID);

prompt
prompt Creating table PMS_SENSITIVE_WORD
prompt =================================
prompt
create table PMS_SENSITIVE_WORD
(
  SENSITIVE_WORD_ID   NUMBER(11) not null,
  SENSITIVE_WORD_NAME VARCHAR2(60),
  STATUS              NUMBER(1),
  CREATE_TIME         TIMESTAMP(6),
  CREATOR             VARCHAR2(20),
  EFFECT_MODULE       VARCHAR2(200)
)
;
alter table PMS_SENSITIVE_WORD
  add constraint PK_PMS_SENSITIVE_WORD primary key (SENSITIVE_WORD_ID);

prompt
prompt Creating table PMS_SITE_CONFIG
prompt ==============================
prompt
create table PMS_SITE_CONFIG
(
  SITE_ID                NUMBER(2) not null,
  SITE_BASIC_DOMAIN      VARCHAR2(100),
  SITE_BASIC_PATH        VARCHAR2(200),
  SITE_BASIC_OPTION      NUMBER(1),
  SITE_SEO_TITLE         VARCHAR2(200),
  SITE_SEO_KEYWORD       VARCHAR2(300),
  SITE_SEO_DESCRIPTION   VARCHAR2(500),
  SITE_PATH_HTML         VARCHAR2(100),
  SITE_PATH_RESOURCE     VARCHAR2(100),
  SITE_RECYCLE_MODE      NUMBER(1),
  SITE_FTP_HOST          VARCHAR2(50),
  SITE_FTP_PORT          NUMBER(16),
  SITE_BASIC_PREADDRESS  VARCHAR2(100),
  SITE_BASIC_MAILADDRESS VARCHAR2(100),
  SITE_BASIC_PHONE       VARCHAR2(50)
)
;
alter table PMS_SITE_CONFIG
  add constraint PK_PMS_SITE_CONFIG primary key (SITE_ID);

prompt
prompt Creating table PMS_STATIC
prompt =========================
prompt
create table PMS_STATIC
(
  SERIAL_NO     NUMBER(11) not null,
  DEPLOY_TYPE   NUMBER(2),
  DEPLOY_RULE   VARCHAR2(200),
  STATUS        NUMBER(1),
  DEPLOY_STATUS NUMBER(1)
)
;
alter table PMS_STATIC
  add constraint PK_PMS_STATIC primary key (SERIAL_NO);

prompt
prompt Creating table PMS_SUIT
prompt =======================
prompt
create table PMS_SUIT
(
  SUIT_ID    NUMBER(11) not null,
  SUIT_NAME  VARCHAR2(100),
  SUIT_STAT  NUMBER(1),
  SUIT_NOTE  VARCHAR2(500),
  CREATETIME TIMESTAMP(6)
)
;
comment on table PMS_SUIT
  is 'ģ����װ';
comment on column PMS_SUIT.SUIT_STAT
  is '״̬���Ƿ�ΪĬ����װ';
alter table PMS_SUIT
  add constraint PK_PMS_SUIT primary key (SUIT_ID);

prompt
prompt Creating table PMS_TAG
prompt ======================
prompt
create table PMS_TAG
(
  TAG_ID        NUMBER(11) not null,
  TAG_NAME      VARCHAR2(60),
  REF_COUNTER   NUMBER(11),
  TOPIC_COUNTER NUMBER(11),
  STATUS        NUMBER(1),
  CREATE_TIME   TIMESTAMP(6),
  CREATOR       VARCHAR2(20)
)
;
alter table PMS_TAG
  add constraint PK_PMS_TAG primary key (TAG_ID);

prompt
prompt Creating table PMS_TEMPLATE
prompt ===========================
prompt
create table PMS_TEMPLATE
(
  TPL_ID   NUMBER(11) not null,
  TPL_NAME VARCHAR2(100),
  SRC_TYPE NUMBER(11),
  MODEL_ID NUMBER(11),
  UPTPL_ID NUMBER(11),
  SUIT_ID  NUMBER(11),
  TPL_SIZE NUMBER(8),
  TPL_PATH VARCHAR2(200),
  TPL_NOTE VARCHAR2(500),
  TPL_TIME TIMESTAMP(6)
)
;
comment on table PMS_TEMPLATE
  is 'ģ��';
comment on column PMS_TEMPLATE.TPL_NAME
  is 'ģ�����';
comment on column PMS_TEMPLATE.SRC_TYPE
  is '���ͣ�1��ģ��';
comment on column PMS_TEMPLATE.MODEL_ID
  is 'ģ��';
comment on column PMS_TEMPLATE.UPTPL_ID
  is '�ϼ�ģ��ID��������¼��ģ���������ļ���ID';
comment on column PMS_TEMPLATE.SUIT_ID
  is 'ģ����װ';
comment on column PMS_TEMPLATE.TPL_SIZE
  is 'ģ���С';
comment on column PMS_TEMPLATE.TPL_PATH
  is 'ģ��·��';
comment on column PMS_TEMPLATE.TPL_NOTE
  is 'ģ������';
comment on column PMS_TEMPLATE.TPL_TIME
  is '����ʱ��';
alter table PMS_TEMPLATE
  add constraint PK_PMS_TEMPLATE primary key (TPL_ID);

prompt
prompt Creating table PMS_TOPIC
prompt ========================
prompt
create table PMS_TOPIC
(
  TOPIC_ID     NUMBER(11) not null,
  MODEL_ID     NUMBER(11),
  TOPIC_NAME   VARCHAR2(200),
  SHORT_NAME   VARCHAR2(200),
  TOPIC_PATH   VARCHAR2(50),
  DESCRIPTION  VARCHAR2(500),
  TITLE_IMG    VARCHAR2(300),
  CONTENT_IMG  VARCHAR2(300),
  PRIORITY     NUMBER(5),
  IS_RECOMMEND NUMBER(1),
  DEL_YN       NUMBER(1),
  LINKURL      VARCHAR2(200),
  CHECK_STATUS NUMBER(1),
  CHECK_REASON VARCHAR2(100),
  CHECKTIME    TIMESTAMP(6),
  CHECKER_ID   NUMBER(11),
  CREATOR      NUMBER(11),
  CREATOR_NAME VARCHAR2(100),
  CREATETIME   TIMESTAMP(6),
  UPDATETIME   TIMESTAMP(6),
  PICTURES     VARCHAR2(3000),
  ATTACHMENT   VARCHAR2(3000),
  MEDIA        VARCHAR2(300),
  CONTENT      CLOB
)
;
alter table PMS_TOPIC
  add constraint PK_JC_TOPIC primary key (TOPIC_ID);

prompt
prompt Creating table PMS_TOPIC_CONTENT
prompt ================================
prompt
create table PMS_TOPIC_CONTENT
(
  SERIAL_NO  NUMBER(11) not null,
  TOPIC_ID   NUMBER(11),
  CONTENT_ID NUMBER(11),
  PRIORITY   NUMBER(5),
  AREA_IDS   VARCHAR2(100)
)
;
alter table PMS_TOPIC_CONTENT
  add constraint PK_PMS_TOPIC_CONTENT primary key (SERIAL_NO);

prompt
prompt Creating table PMS_TOPIC_TAG
prompt ============================
prompt
create table PMS_TOPIC_TAG
(
  SERIAL_NO NUMBER(11) not null,
  TAG_ID    NUMBER(11),
  TOPIC_ID  NUMBER(11)
)
;
alter table PMS_TOPIC_TAG
  add constraint PK_PMS_TOPIC_TAG primary key (SERIAL_NO);

prompt
prompt Creating table PMS_TPLCHL
prompt =========================
prompt
create table PMS_TPLCHL
(
  SERIAL_NO  NUMBER(11) not null,
  CHANNEL_ID NUMBER(11),
  SUIT_ID    NUMBER(11),
  TPL_ID     NUMBER(11),
  TPL_TYPE   VARCHAR2(1)
)
;
alter table PMS_TPLCHL
  add constraint PK_PMS_TPLCHL primary key (SERIAL_NO);

prompt
prompt Creating table PMS_TPLTOPIC
prompt ===========================
prompt
create table PMS_TPLTOPIC
(
  SERIAL_NO NUMBER(11) not null,
  TOPIC_ID  NUMBER(11),
  SUIT_ID   NUMBER(11),
  TPL_ID    NUMBER(11),
  TPL_TYPE  VARCHAR2(1)
)
;
alter table PMS_TPLTOPIC
  add constraint PK_PMS_TPLTOPIC primary key (SERIAL_NO);

prompt
prompt Creating table PMS_TPL_DEPLOY
prompt =============================
prompt
create table PMS_TPL_DEPLOY
(
  SERIAL_NO      NUMBER(11) not null,
  SUIT_ID        NUMBER(11),
  TPL_ID         NUMBER(11),
  PAGE_ID        NUMBER(11),
  PAGE_NAME      VARCHAR2(200),
  HTML_PAGE_NAME VARCHAR2(200)
)
;
comment on table PMS_TPL_DEPLOY
  is 'ģ�巢��';
comment on column PMS_TPL_DEPLOY.SERIAL_NO
  is '���';
comment on column PMS_TPL_DEPLOY.SUIT_ID
  is '��װID';
comment on column PMS_TPL_DEPLOY.TPL_ID
  is 'ģ��ID';
comment on column PMS_TPL_DEPLOY.PAGE_ID
  is '����ID��1����ҳ';
comment on column PMS_TPL_DEPLOY.PAGE_NAME
  is 'ҳ��url���';
comment on column PMS_TPL_DEPLOY.HTML_PAGE_NAME
  is 'ҳ�����';
alter table PMS_TPL_DEPLOY
  add constraint PK_PMS_TPL_DEPLOY primary key (SERIAL_NO);

prompt
prompt Creating table TEMP_RES_CODE_DEF
prompt ================================
prompt
create table TEMP_RES_CODE_DEF
(
  RES_CODE        NUMBER(6) not null,
  RES_NAME        VARCHAR2(64) not null,
  RES_TYPE        NUMBER(2) not null,
  USER_TYPE       NUMBER(4),
  RES_DESC        VARCHAR2(64),
  FEATURE_DES     VARCHAR2(64),
  VALID_DATE      DATE not null,
  EXPIRE_DATE     DATE not null,
  IS_DETAIL       NUMBER(1),
  VALID_DAYS      NUMBER(4) not null,
  FEE_ITEM        NUMBER(9),
  OPERATION_ID    NUMBER(10),
  RES_ADSCRIPTION NUMBER(2),
  EXT_HOLDS       NUMBER(2),
  EXT_HOLDS1      VARCHAR2(20),
  EXT_HOLDS2      VARCHAR2(20),
  EXT_HOLDS3      VARCHAR2(64),
  EQUIP_TYPE      NUMBER(6) default 0,
  REGION_CODE     NUMBER(4) default 0,
  COUNTY_CODE     NUMBER(4),
  ORG_ID          NUMBER(8),
  IS_SPECIAL      NUMBER(1),
  UNIT            VARCHAR2(20),
  EXT_HOLDS4      VARCHAR2(512),
  EXT_HOLDS5      VARCHAR2(512),
  EXT_HOLDS6      VARCHAR2(512)
)
;

prompt
prompt Creating table TS_DISTRICT
prompt ==========================
prompt
create table TS_DISTRICT
(
  DISTRICT_ID     NUMBER(11) not null,
  TS_DISTRICT_ID  NUMBER(11),
  DISTRICT_CODE   VARCHAR2(18) not null,
  DISTRICT_NAME   VARCHAR2(200),
  DISTRICT_LETTER VARCHAR2(10),
  AREA            NUMBER(2)
)
;
comment on column TS_DISTRICT.DISTRICT_ID
  is '����ID';
comment on column TS_DISTRICT.TS_DISTRICT_ID
  is '����ID';
comment on column TS_DISTRICT.DISTRICT_CODE
  is '������룺6λ���ο����GB2206-2007';
comment on column TS_DISTRICT.DISTRICT_NAME
  is '�������';
comment on column TS_DISTRICT.DISTRICT_LETTER
  is '��ĸ��';
comment on column TS_DISTRICT.AREA
  is '��������1����������2����������3�����ϵ���4�����е���5����������6����������7�����ϵ���';
alter table TS_DISTRICT
  add constraint PK_TS_DISTRICT primary key (DISTRICT_ID);

prompt
prompt Creating table TS_PTL_USER
prompt ==========================
prompt
create table TS_PTL_USER
(
  PTL_USER_ID      NUMBER(11) not null,
  USERNAME         VARCHAR2(100),
  GENDER           NUMBER(1),
  PASSWORD         VARCHAR2(40),
  NICKNAME         VARCHAR2(80),
  REAL_NAME        VARCHAR2(80),
  PHONE            VARCHAR2(100),
  RESI_PROV        VARCHAR2(40),
  RESI_CITY        VARCHAR2(40),
  RESI_DIST        VARCHAR2(40),
  ADDR             VARCHAR2(400),
  ZIP_CODE         NUMBER(6),
  LOGIN_TIME       TIMESTAMP(6),
  STATUS           NUMBER(1),
  EMAIL            VARCHAR2(100),
  GROUP_ID         NUMBER(11),
  BIRTHDAY         VARCHAR2(20),
  QQ_NUM           VARCHAR2(20),
  MSN_NUM          VARCHAR2(50),
  CELLPHONE        VARCHAR2(20),
  INTRO_INFO       VARCHAR2(1500),
  LOGIN_COUNT      NUMBER(11),
  REGISTER_TIME    TIMESTAMP(6),
  IS_MOBILE_CLIENT NUMBER(1)
)
;
alter table TS_PTL_USER
  add constraint PK_TS_PTL_USER primary key (PTL_USER_ID);

prompt
prompt Creating table TS_ROLE
prompt ======================
prompt
create table TS_ROLE
(
  ROLE_ID   NUMBER(11) not null,
  ROLE_NAME VARCHAR2(100),
  PRIORITY  NUMBER(11),
  IS_SUPER  VARCHAR2(1),
  ROLE_NOTE VARCHAR2(200),
  STATUS    NUMBER(1)
)
;
alter table TS_ROLE
  add constraint PK_TS_ROLE primary key (ROLE_ID);

prompt
prompt Creating table TS_USER
prompt ======================
prompt
create table TS_USER
(
  USER_ID         NUMBER(11) not null,
  USERNAME        VARCHAR2(100),
  PASSWORD        VARCHAR2(100),
  FULLNAME        VARCHAR2(100),
  GENDER          NUMBER(1),
  EMAIL           VARCHAR2(100),
  STATUS          NUMBER(1),
  REGISTER_TIME   TIMESTAMP(6),
  REGISTER_IP     VARCHAR2(50),
  LAST_LOGIN_TIME TIMESTAMP(6),
  LAST_LOGIN_IP   VARCHAR2(50),
  LOGIN_COUNT     NUMBER(11),
  IS_ADMIN        NUMBER(1)
)
;
alter table TS_USER
  add constraint PK_TS_USER primary key (USER_ID);

prompt
prompt Creating table TS_USERROLE
prompt ==========================
prompt
create table TS_USERROLE
(
  USER_ID NUMBER(11) not null,
  ROLE_ID NUMBER(11) not null
)
;
alter table TS_USERROLE
  add constraint PK_TS_USERROLE primary key (USER_ID, ROLE_ID);

prompt
prompt Creating sequence SEQADLOCATIONID
prompt =================================
prompt
create sequence SEQADLOCATIONID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQADVERTISEMENTID
prompt ====================================
prompt
create sequence SEQADVERTISEMENTID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQBACKLANDLOGID
prompt ==================================
prompt
create sequence SEQBACKLANDLOGID
minvalue 1
maxvalue 999999999999999999999999999
start with 3220
increment by 1
cache 20;

prompt
prompt Creating sequence SEQBACKLOGID
prompt ==============================
prompt
create sequence SEQBACKLOGID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQBRANDID
prompt ============================
prompt
create sequence SEQBRANDID
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCARTSKUID
prompt ==============================
prompt
create sequence SEQCARTSKUID
minvalue 1
maxvalue 999999999999999999999999999
start with 3080
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCATID
prompt ==========================
prompt
create sequence SEQCATID
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCHANNELID
prompt ==============================
prompt
create sequence SEQCHANNELID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCONSOLELOGID
prompt =================================
prompt
create sequence SEQCONSOLELOGID
minvalue 1
maxvalue 999999999999999999999999999
start with 3240
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCONSTRID
prompt =============================
prompt
create sequence SEQCONSTRID
minvalue 1
maxvalue 999999999999999999999999999
start with 3060
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCONTENTHISID
prompt =================================
prompt
create sequence SEQCONTENTHISID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCONTENTID
prompt ==============================
prompt
create sequence SEQCONTENTID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCONTENTSHAREID
prompt ===================================
prompt
create sequence SEQCONTENTSHAREID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCONTENTTAGID
prompt =================================
prompt
create sequence SEQCONTENTTAGID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCONTENTTYPEID
prompt ==================================
prompt
create sequence SEQCONTENTTYPEID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCRMITFLOGID
prompt ================================
prompt
create sequence SEQCRMITFLOGID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCSID
prompt =========================
prompt
create sequence SEQCSID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQDISCOUNTID
prompt ===============================
prompt
create sequence SEQDISCOUNTID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQDISTRIID
prompt =============================
prompt
create sequence SEQDISTRIID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQEBADLOCATIONID
prompt ===================================
prompt
create sequence SEQEBADLOCATIONID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQEBADVERTISEMENTID
prompt ======================================
prompt
create sequence SEQEBADVERTISEMENTID
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQEBCITYGROUPON
prompt ==================================
prompt
create sequence SEQEBCITYGROUPON
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQEBRECOMMITEMID
prompt ===================================
prompt
create sequence SEQEBRECOMMITEMID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQEBSIMCARDPROCESSLOGID
prompt ==========================================
prompt
create sequence SEQEBSIMCARDPROCESSLOGID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQFEATUREID
prompt ==============================
prompt
create sequence SEQFEATUREID
minvalue 1
maxvalue 999999999999999999999999999
start with 3040
increment by 1
cache 20;

prompt
prompt Creating sequence SEQGROUPONID
prompt ==============================
prompt
create sequence SEQGROUPONID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQHELPTIPID
prompt ==============================
prompt
create sequence SEQHELPTIPID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQINVOICEID
prompt ==============================
prompt
create sequence SEQINVOICEID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQITEMID
prompt ===========================
prompt
create sequence SEQITEMID
minvalue 1
maxvalue 999999999999999999999999999
start with 3060
increment by 1
cache 20;

prompt
prompt Creating sequence SEQITEMNO
prompt ===========================
prompt
create sequence SEQITEMNO
minvalue 1
maxvalue 999999999999999999999999999
start with 3060
increment by 1
cache 20;

prompt
prompt Creating sequence SEQKEYWORDSID
prompt ===============================
prompt
create sequence SEQKEYWORDSID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQMAILID
prompt ===========================
prompt
create sequence SEQMAILID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQMEMBERGROUPID
prompt ==================================
prompt
create sequence SEQMEMBERGROUPID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQMEMBERID
prompt =============================
prompt
create sequence SEQMEMBERID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQMESSAGEID
prompt ==============================
prompt
create sequence SEQMESSAGEID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQMESSAGETYPEID
prompt ==================================
prompt
create sequence SEQMESSAGETYPEID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQMODELID
prompt ============================
prompt
create sequence SEQMODELID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQMODELITEMID
prompt ================================
prompt
create sequence SEQMODELITEMID
minvalue 1
maxvalue 999999999999999999999999999
start with 400
increment by 1
cache 20;

prompt
prompt Creating sequence SEQMYFAVID
prompt ============================
prompt
create sequence SEQMYFAVID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQMYFAVSKUID
prompt ===============================
prompt
create sequence SEQMYFAVSKUID
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQOFFERGROUPID
prompt =================================
prompt
create sequence SEQOFFERGROUPID
minvalue 1
maxvalue 999999999999999999999999999
start with 3040
increment by 1
cache 20;

prompt
prompt Creating sequence SEQOFFERID
prompt ============================
prompt
create sequence SEQOFFERID
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQOFFERNO
prompt ============================
prompt
create sequence SEQOFFERNO
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQOLBANKID
prompt =============================
prompt
create sequence SEQOLBANKID
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQORDERDETAILID
prompt ==================================
prompt
create sequence SEQORDERDETAILID
minvalue 1
maxvalue 999999999999999999999999999
start with 3100
increment by 1
cache 20;

prompt
prompt Creating sequence SEQORDEREXEC
prompt ==============================
prompt
create sequence SEQORDEREXEC
minvalue 1
maxvalue 999999999999999999999999999
start with 3100
increment by 1
cache 20;

prompt
prompt Creating sequence SEQORDERID
prompt ============================
prompt
create sequence SEQORDERID
minvalue 1
maxvalue 999999999999999999999999999
start with 3100
increment by 1
cache 20;

prompt
prompt Creating sequence SEQORDERITEMID
prompt ================================
prompt
create sequence SEQORDERITEMID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQORDERLOGID
prompt ===============================
prompt
create sequence SEQORDERLOGID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQORDERNO
prompt ============================
prompt
create sequence SEQORDERNO
minvalue 1
maxvalue 999999999999999999999999999
start with 3100
increment by 1
cache 20;

prompt
prompt Creating sequence SEQORDERREMINDLOG
prompt ===================================
prompt
create sequence SEQORDERREMINDLOG
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQORDERREMINDPHONE
prompt =====================================
prompt
create sequence SEQORDERREMINDPHONE
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQORDERSHIPADDRID
prompt ====================================
prompt
create sequence SEQORDERSHIPADDRID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPARAVALUEID
prompt ================================
prompt
create sequence SEQPARAVALUEID
minvalue 1
maxvalue 999999999999999999999999999
start with 6080
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPAYCHECKDIFFID
prompt ===================================
prompt
create sequence SEQPAYCHECKDIFFID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPAYCHECKID
prompt ===============================
prompt
create sequence SEQPAYCHECKID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPAYCHECKTOTALID
prompt ====================================
prompt
create sequence SEQPAYCHECKTOTALID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPAYRECORDID
prompt ================================
prompt
create sequence SEQPAYRECORDID
minvalue 1
maxvalue 999999999999999999999999999
start with 3120
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPEMISSIONID
prompt ================================
prompt
create sequence SEQPEMISSIONID
minvalue 1
maxvalue 999999999999999999999999999
start with 200
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPERMID
prompt ===========================
prompt
create sequence SEQPERMID
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPOID
prompt =========================
prompt
create sequence SEQPOID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPREDEPLOYID
prompt ================================
prompt
create sequence SEQPREDEPLOYID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPTLUSERID
prompt ==============================
prompt
create sequence SEQPTLUSERID
minvalue 1
maxvalue 999999999999999999999999999
start with 3120
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPWID
prompt =========================
prompt
create sequence SEQPWID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQREGIONID
prompt =============================
prompt
create sequence SEQREGIONID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQRESOURCEID
prompt ===============================
prompt
create sequence SEQRESOURCEID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQRETEXCID
prompt =============================
prompt
create sequence SEQRETEXCID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQROLEID
prompt ===========================
prompt
create sequence SEQROLEID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSECKILLID
prompt ==============================
prompt
create sequence SEQSECKILLID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSECKILLQUAID
prompt =================================
prompt
create sequence SEQSECKILLQUAID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSENSITIVEID
prompt ================================
prompt
create sequence SEQSENSITIVEID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSHIPADDRID
prompt ===============================
prompt
create sequence SEQSHIPADDRID
minvalue 1
maxvalue 999999999999999999999999999
start with 20080
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDBRANDID
prompt ===================================
prompt
create sequence SEQSIMCARDBRANDID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDBRANDPACKAGERELID
prompt =============================================
prompt
create sequence SEQSIMCARDBRANDPACKAGERELID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDDESCID
prompt ==================================
prompt
create sequence SEQSIMCARDDESCID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDID
prompt ==============================
prompt
create sequence SEQSIMCARDID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDLABELID
prompt ===================================
prompt
create sequence SEQSIMCARDLABELID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDLABELRELID
prompt ======================================
prompt
create sequence SEQSIMCARDLABELRELID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDPACKAGEID
prompt =====================================
prompt
create sequence SEQSIMCARDPACKAGEID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDPACKAGERELID
prompt ========================================
prompt
create sequence SEQSIMCARDPACKAGERELID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDSUITID
prompt ==================================
prompt
create sequence SEQSIMCARDSUITID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDSUITRELID
prompt =====================================
prompt
create sequence SEQSIMCARDSUITRELID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMIDCARD
prompt ==============================
prompt
create sequence SEQSIMIDCARD
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMIDCARDID
prompt ================================
prompt
create sequence SEQSIMIDCARDID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSKUFREEID
prompt ==============================
prompt
create sequence SEQSKUFREEID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSKUID
prompt ==========================
prompt
create sequence SEQSKUID
minvalue 1
maxvalue 999999999999999999999999999
start with 3060
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSKUOFFERID
prompt ===============================
prompt
create sequence SEQSKUOFFERID
minvalue 1
maxvalue 999999999999999999999999999
start with 3040
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSLOTID
prompt ===========================
prompt
create sequence SEQSLOTID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSLOTSKUID
prompt ==============================
prompt
create sequence SEQSLOTSKUID
minvalue 1
maxvalue 999999999999999999999999999
start with 3040
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSPECVALUEID
prompt ================================
prompt
create sequence SEQSPECVALUEID
minvalue 1
maxvalue 999999999999999999999999999
start with 3080
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSUITID
prompt ===========================
prompt
create sequence SEQSUITID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSUITITEMID
prompt ===============================
prompt
create sequence SEQSUITITEMID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSUITVASID
prompt ==============================
prompt
create sequence SEQSUITVASID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSUPPLIERID
prompt ===============================
prompt
create sequence SEQSUPPLIERID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTAGID
prompt ==========================
prompt
create sequence SEQTAGID
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTAGIMGID
prompt =============================
prompt
create sequence SEQTAGIMGID
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTOPICCONTENTID
prompt ===================================
prompt
create sequence SEQTOPICCONTENTID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTOPICID
prompt ============================
prompt
create sequence SEQTOPICID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTOPICTAGID
prompt ===============================
prompt
create sequence SEQTOPICTAGID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTPLCATID
prompt =============================
prompt
create sequence SEQTPLCATID
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTPLCHLSERIAL
prompt =================================
prompt
create sequence SEQTPLCHLSERIAL
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTPLDEPLOY
prompt ==============================
prompt
create sequence SEQTPLDEPLOY
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTPLID
prompt ==========================
prompt
create sequence SEQTPLID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTPLOFFERGROUPID
prompt ====================================
prompt
create sequence SEQTPLOFFERGROUPID
minvalue 1
maxvalue 999999999999999999999999999
start with 3040
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTPLTOPICID
prompt ===============================
prompt
create sequence SEQTPLTOPICID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQUSERID
prompt ===========================
prompt
create sequence SEQUSERID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PRODUCTID
prompt ===============================
prompt
create sequence SEQ_PRODUCTID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ROLEID
prompt ============================
prompt
create sequence SEQ_ROLEID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_USERID
prompt ============================
prompt
create sequence SEQ_USERID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating view EB_V_ITEMPRICEVIEW
prompt ================================
prompt
create or replace view eb_v_itempriceview as
select item_id,min(sku_price) as minSkuPrice,max(sku_price) as maxSkuPrice,min(market_price) as minMarketPrice,max(market_price) as maxMarketPrice from eb_sku
where show_status=0 and sku_type=1
group by item_id
/

prompt
prompt Creating function SQUIRREL_GET_ERROR_OFFSET
prompt ===========================================
prompt
create or replace function SQUIRREL_GET_ERROR_OFFSET (query IN varchar2) return number authid current_user is      l_theCursor     integer default dbms_sql.open_cursor;      l_status        integer; begin          begin          dbms_sql.parse(  l_theCursor, query, dbms_sql.native );          exception                  when others then l_status := dbms_sql.last_error_position;          end;          dbms_sql.close_cursor( l_theCursor );          return l_status; end;
/

prompt
prompt Creating trigger EB_JBPM_EXECTION_TRIGGER
prompt =========================================
prompt
create or replace trigger eb_jbpm_exection_trigger
after insert  on jbpm4_execution
for each row
declare
a varchar2(200);
b number;
c number;
d number;
begin
if :new.superexec_ is null
then update Eb_Order_Execution e11 set e11.execution =:new.id_ , e11.is_now =1 where e11.execution_id =:new.dbid_;
else
/*
����ǵ�һ�ν��������̣���insert���ڶ�����update
*/
select max(order_num) into a from eb_order_execution  where execution_id=:new.superexec_;
select count(1) into b from eb_order_execution  where substr(execution,1,instr(execution,'.')) = substr(:new.id_,1,instr(:new.id_,'.')) and execution_id =:new.superexec_;
select SEQORDEREXEC.NEXTVAL into c from dual;
if b=0
then
update Eb_Order_Execution e11 set e11.is_now =0 where e11.execution_id =:new.superexec_;
insert into Eb_Order_Execution values(c,a,:new.superexec_,:new.id_,1);
else
update Eb_Order_Execution e11 set e11.is_now =0 where e11.execution_id =:new.superexec_;
update Eb_Order_Execution  set execution=:new.id_,IS_NOW =1
where substr(execution,1,instr(execution,'.')) = substr(:new.id_,1,instr(:new.id_,'.'))
     and execution_id =:new.superexec_;
end if;
end if;
end;
/

prompt
prompt Creating trigger EB_JBPM_TASK_TRIGGER
prompt =====================================
prompt
create or replace trigger eb_jbpm_task_trigger
after insert  on jbpm4_task
for each row
declare
a varchar2(200);
d number;
begin
select   substr(:new.execution_id_ ,1,instr(:new.execution_id_,'.')) into a from dual;
if a ='ailk.'
then
select e.execution_id into d from Eb_Order_Execution e where e.execution = :new.execution_id_;
update Eb_Order_Execution e11 set e11.is_now =0 where e11.execution_id =d;
update Eb_Order_Execution e11 set e11.is_now =1 where e11.execution = :new.execution_id_;
end if;
end;
/


spool off
