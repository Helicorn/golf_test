--===========================
--������(ȸ��,�����Խ���)
--ȸ�� MemberVO�� ù ����� application.properties ddl�� update�� create�� �����ؼ� ����, ���� update�� ����.
--ù ���� ���� ���̺� �߰��ؾ� �ܷ�Ű ������ ��Ȱ��.

--�����Խ��� 
create table golforboard( --���̺� ����
  b_no number(38) primary key --�Խù� ��ȣ
 ,username varchar2(100) not null --�۾���
 ,b_title varchar2(200) not null --������
 ,b_cont varchar2(4000) not null --�۳���
 ,b_file varchar2(200) --÷�����ϸ�
 ,b_hit number(38) default 0 --��ȸ��
 ,b_ref number(38) --�����۰� ������ �亯���� �����ִ� �� �׷��ȣ��
 ,b_step number(38) --�������̸� 0,ù��° �亯���̸� 1,�ι�° �亯���̸� 2,�����۰� �亯���� �����ϴ� ��ȣ���̸鼭 ���° �亯���ΰ��� �˷��ش�.
 ,b_level number(38) --�亯�� ���ļ���
 ,b_date date --�� ��ϳ�¥
 ,b_like number(38) default 0
);

alter table golforboard add constraint golforboard_username_fk
foreign key(username) references MemberVO(username);

create sequence b_no_seq
start with 1 --1���� ����
increment by 1 --1�� ����
nocache;

create table golforboard_reply(
r_no number(10,0), -- ��� ��ȣ
b_no number(10,0) not null, -- �Խù� ��ȣ
reply varchar2(1000) not null, -- ��� ����
replyer varchar2(50) not null, -- ��� �ۼ���
replyDate date default sysdate, -- �ۼ���
updateDate date default sysdate -- ������
);

-- ���
create sequence seq_reply;
-- r_no ������ ó�� ����.
alter table golforboard_reply add constraint pk_reply primary key(r_no);
--���̺� �����Ŀ� ���������� �߰�, pk�� r_no.
alter table golforboard_reply add constraint fk_reply_board
foreign key (b_no) references golforboard(b_no);
-- �ܷ�Ű�� golforboard(b_no) ���.


--���ƿ� 
create table likes (
    likes_idx number(10,0) primary key,
    likes_no number(10,0),
    board_no number(10,0),
    nickname varchar2(50),
    foreign key (board_no) references golforboard (b_no),
    foreign key (nickname) references memberVO (nickname)

);


create sequence likes_no_seq
start with 1 --1���� ����
increment by 1 --1�� ����
nocache;
 


--===========================
--��ο�(��ŷ)

create table scboard(
sc_no number(38)
,sc_id varchar2(50)
,sc_name varchar2(50)
,sc_title varchar2(50)
,sc_playdate varchar2(50)
,sc_cont varchar2(4000)
,sc_file varchar2(100)
,sc_hit number(38) default 0
,sc_ref number(38)
,sc_step number(38)
,sc_level number(38)
,sc_notice number(38)
,sc_date date
);


create table score_card(
s_id varchar2(50)
,s_nickname varchar2(255)
,s_location varchar2(50)
,s_putting number(38)
,s_range number(38)
,s_date varchar2(50)
,s_sort number(38)
,s_sumscore number(38)
,s_updated number(38) default 0
,s_strike number(38)
,s_obandhazard number(38)
);

create table ranking(
r_no number(38)
,r_id varchar2(50)
,r_nickname varchar2(255)
,r_sum number(38)
,r_maxrange number(38)
,r_province varchar2(50)
);

create sequence rno_seq
start with 1
increment by 1
nocache;

create sequence test_scboard_seq
start with 1
increment by 1
nocache;


--=================================
--�����ڰ������װԽ���(�����)
--abboard ���̺� ����
create table abboard(
 abboard_no number(38) primary key --�Խù� ��ȣ
 ,abboard_name varchar2(100) not null --�ۼ���
 ,abboard_title varchar2(200) not null --����
 ,abboard_pwd varchar2(20) not null --���
 ,abboard_cont varchar2(4000) not null --����
 ,abboard_hit number(38) default 0--��ȸ��
 ,abboard_ref number(38) --�����۰� �亯���� �����ִ� �׷��ȣ����
 ,abboard_step number(38) --�������̸� 0,ù��° �亯�� 1. �����۰�
 --�亯���� �����ϴ� ��ȣ��,���° �亯���ΰ��� �����ϴ� ��ȣ��
 ,abboard_level number(38) --�亯�� ���� ����
 ,abboard_date date --��ϳ�¥
);

--abboard_no_seq ������ ����
create sequence abboard_no_seq
start with 1 --1���� ����
increment by 1 --1�� �����ɼ�
nocache;

--=================================
--������(������ �˻�)
--������ ���̺� ����
create table golf_couse(
gc_no number(38) primary key , -- ������ȣ
gc_image varchar2(200), --�̹��� ���
gc_title varchar2(200), --�������
gc_english varchar2(200), --�����念����
gc_area varchar2(200),--����
gc_hole number(38), --Ȧ
gc_golf number(38), --��
gc_length number(38),-- ����
gc_kind varchar2(200),--�ܵ�����
gc_type varchar2(200),--�ڽ�Ÿ��
gc_configuration varchar2(200),--�ڽ�����
gc_caddy varchar2(200),--ĳ�� (��/��)
gc_cart varchar2(200),--īƮ (��/��)
gc_architects varchar2(200), --�����ڸ�
gc_content varchar2(2000), --�����峻��
gc_address_postcode varchar2(200),--�����ȣ
gc_address_roadAddress varchar2(200),--���θ��ּ�
gc_address_jibunAddress varchar2(200), --�����ּ�
gc_address_detailAddress varchar2(200), --���ּ�
gc_address_extraAddress varchar2(200),--�����׸�
gc_phone varchar2(50), --��ȭ��ȣ
gc_fax varchar2(50), --�ѽ�
gc_move varchar2(1000),--��������� �����̵���� 
gc_date varchar2(200) --������ ���峯¥
gc_replycnt number(38)default 0 --��ۼ� ī����
);


--������ ������ȣ ������ ����
create sequence golf_couse_seq
start with 1 --1���� ����
increment by 1 --1�� ����
nocache; --�ӽ� �޸𸮸� ������� �ʰڴٴ� �ǹ�.


--gc_reply���̺��� �Խ��ǹ�ȣ�� �������� ��ۼ��� ī���� �Ͽ�  golf_couse���̺� �߰��� gc_replycnt�÷� ���ڵ尪�� ����
update golf_couse set gc_replycnt=(select count(gc_no) from gc_reply where gc_no=golf_couse.gc_no)where gc_no>0;

--��� ���̺� gc_reply ����
create table gc_reply(
    gc_rno number(38) primary key--��� ��ȣ
    ,gc_no number(38) default 0 --�ܷ�Ű ���� �������� �߰� ����. golf_couse ���̺� �� ��ȣ���� �����.���� ���谡 ������.
    ,gc_replyer varchar2(100) not null --����ۼ���
    ,gc_replytext varchar2(4000) not null --��� ����
    ,gc_regdate date -- ��� ��ϳ�¥
    ,gc_updatedate date -- ��� ������¥

);
-- gc_no_seq ������ ����
create sequence gc_no_seq
start with 1 --1���� ����
increment by 1 -- 1�� ���� 
nocache; --�ӽ� �޸� ������� �ʰڴٴ� �ǹ�



--�ܷ�Ű �������� �߰� ����
alter table gc_reply add constraint gc_reply_gc_no_fk
foreign key(gc_no) references golf_couse(gc_no);



--��� ������ ����
create sequence gc_rno_seq
start with 1--1���� ����
increment by 1 --1�� ����
nocache;

--=====================================
--������(Ŭ����)

----- ���� ���̺�
create table address(
adno number(38),
adname varchar2(100),
adname2 varchar2(100)
);

-- ���� ������ȣ ������
create sequence add_seq
start with 1
increment by 1
nocache;

-- ���� insert
insert into address values(add_seq.nextval, '������', '��⵵ ��ü');
insert into address values(add_seq.nextval, '������', '����');
insert into address values(add_seq.nextval, '������', '��õ');

insert into address values(add_seq.nextval, '������', '������ ��ü');
insert into address values(add_seq.nextval, '������', '��õ');
insert into address values(add_seq.nextval, '������', '����');


insert into address values(add_seq.nextval, '��û��', '��û�� ��ü');
insert into address values(add_seq.nextval, '��û��', '����');
insert into address values(add_seq.nextval, '��û��', '����');

insert into address values(add_seq.nextval, '����', '���� ��ü');
insert into address values(add_seq.nextval, '����', '����');
insert into address values(add_seq.nextval, '����', '����');

insert into address values(add_seq.nextval, '���', '��� ��ü');
insert into address values(add_seq.nextval, '���', '�λ�');
insert into address values(add_seq.nextval, '���', '�뱸');
insert into address values(add_seq.nextval, '���', '���');

insert into address values(add_seq.nextval, '���ֵ�', '���ֵ� ��ü');
insert into address values(add_seq.nextval, '���ֵ�', '���ֽ�');
insert into address values(add_seq.nextval, '���ֵ�', '��������');


-- ���� ���̺�
create table cteacher(
tno number(38) primary key, --���� ������ȣ
tname varchar2(50), --�����
tgender varchar2(60), --���� ����
tcareer varchar2(2000), --���� �Ұ� �Ǵ� ��»���
tdate date --���� ��� ��¥
);


--���� ������
create sequence ct_seq
start with 100
increment by 1
nocache;


--���� �ʵ� Ŭ���� ���̺� ����
create table field_class(
fno number(38) primary key, --Ŭ���� ������ȣ
tno number(38), --���� ������ȣ: �ܷ�Ű ����
ftitle varchar2(200), --Ŭ������
fphone varchar2(50), --Ŭ���� ��ȭ��ȣ
faddr varchar2(200), --Ŭ���� ���� ��з�
faddr2 varchar2(200), --Ŭ���� ���� �Һз�
fimage varchar2(200), --�̹��� ���
fdate date, --Ŭ���� ������¥
fsprice number(38), --�ʵ� Ŭ���� STANDARD ����
fsrounding number(38), -- STANDARD ���� Ƚ��
fsdesc varchar2(1000), -- STANDARD �� ����
fstime number(38), -- STANDARD 1ȸ�� ���� �ð�(��)
fdprice number(38), --�ʵ� Ŭ���� DELUXE ����
fdrounding number(38), -- DELUXE ���� Ƚ��
fddesc varchar2(1000), -- DELUXE �� ����
fdtime number(38), -- DELUXE 1ȸ�� ���� �ð�(��)
fpprice number(38), --�ʵ� Ŭ���� PREMIUM ����
fprounding number(38), -- PREMIUM ���� Ƚ��
fpdesc varchar2(1000), -- PREMIUM �� ����
fptime number(38) -- PREMIUM 1ȸ�� ���� �ð�(��)
);

-- �ʵ� Ŭ���� ������
create sequence fd_seq
start with 10000
increment by 1
nocache;

-- �ʵ� Ŭ���� ���̺� ���� ������ȣ �ܷ�Ű ����
ALTER TABLE field_class 
ADD CONSTRAINTS fk_tno FOREIGN KEY (tno) 
REFERENCES cteacher(tno) ON DELETE CASCADE;


--�¶��� Ŭ���� ���̺�
create table online_class(
ono number(38) primary key, --Ŭ���� ������ȣ
tno number(38), --���� ������ȣ: �ܷ�Ű ����
otitle varchar2(200), --Ŭ������
ophone varchar2(50), --Ŭ���� ��ȭ��ȣ
oimage varchar2(200), --�̹��� ���
odate date, --Ŭ���� ������¥
oprice number(38), --�¶��� Ŭ���� ����
odesc varchar2(1000), --�¶��� Ŭ���� �� ����
otime number(38), --�¶��� Ŭ���� �����Ⱓ
olevel varchar2(50) --�¶��� Ŭ���� ��õ ����
);

-- �¶��� Ŭ���� ������
create sequence ol_seq
start with 20000
increment by 1
nocache;


-- �¶��� Ŭ���� ���̺� ���� ������ȣ �ܷ�Ű ����
ALTER TABLE online_class 
ADD CONSTRAINTS fk_tno2 FOREIGN KEY (tno) 
REFERENCES cteacher(tno) ON DELETE CASCADE;

