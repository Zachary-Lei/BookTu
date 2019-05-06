/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/4/27 17:54:17                           */
/*==============================================================*/


drop table if exists Book;

drop table if exists BookComment;

drop table if exists CollectedLink;

drop table if exists MsgLeft;

drop table if exists Orders;

drop table if exists Post;

drop table if exists PostComment;

drop table if exists Sale;

drop table if exists SaleComment;

drop table if exists User;

drop table if exists User_colection;

/*==============================================================*/
/* Table: Book                                                  */
/*==============================================================*/
create table Book
(
   ISBN                 int not null,
   bookname             varchar(50),
   author               varchar(50),
   introduction         varchar(500),
   score                int,
   type                 int,
   primary key (ISBN)
);

/*==============================================================*/
/* Table: BookComment                                           */
/*==============================================================*/
create table BookComment
(
   b_comment_id         int not null,
   account              int not null,
   ISBN                 int not null,
   time                 int,
   content              varchar(500),
   num_likes            int,
   reply_to             int,
   primary key (b_comment_id)
);

/*==============================================================*/
/* Table: CollectedLink                                         */
/*==============================================================*/
create table CollectedLink
(
   collection_id        int not null,
   link                 varchar(500),
   link_name            varchar(100),
   primary key (collection_id)
);

alter table CollectedLink comment 'ÊÕ²Ø';

/*==============================================================*/
/* Table: MsgLeft                                               */
/*==============================================================*/
create table MsgLeft
(
   msg_id               int not null,
   account              int not null,
   time                 int,
   content              varchar(500),
   primary key (msg_id)
);

alter table MsgLeft comment 'ÁôÑÔ';

/*==============================================================*/
/* Table: Orders                                                */
/*==============================================================*/
create table Orders
(
   order_id             int not null,
   sale_id              int not null,
   account              int not null,
   time                 int,
   recv_address         varchar(100),
   num_purchase         int,
   primary key (order_id)
);

/*==============================================================*/
/* Table: Post                                                  */
/*==============================================================*/
create table Post
(
   post_id              int not null,
   account              int not null,
   time                 int,
   title                varchar(50),
   content              varchar(500),
   num_likes            int,
   type                 int,
   primary key (post_id)
);

/*==============================================================*/
/* Table: PostComment                                           */
/*==============================================================*/
create table PostComment
(
   p_comment_id         int not null,
   post_id              int not null,
   account              int not null,
   time                 int,
   content              varchar(500),
   num_likes            int,
   reply_to             int,
   primary key (p_comment_id)
);

/*==============================================================*/
/* Table: Sale                                                  */
/*==============================================================*/
create table Sale
(
   sale_id              int not null,
   ISBN                 int not null,
   merchant             varchar(50),
   price                int,
   send_address         varchar(100),
   num_sold             int,
   primary key (sale_id)
);

/*==============================================================*/
/* Table: SaleComment                                           */
/*==============================================================*/
create table SaleComment
(
   s_comment_id         int not null,
   sale_id              int not null,
   account              int not null,
   time                 int,
   content              varchar(500),
   num_likes            int,
   reply_to             int,
   primary key (s_comment_id)
);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   account              int not null,
   password             int,
   nickname             varchar(25),
   avatar               longblob,
   score                int,
   introduction         varchar(500),
   primary key (account)
);

/*==============================================================*/
/* Table: User_colection                                        */
/*==============================================================*/
create table User_colection
(
   collection_id        int not null,
   account              int not null,
   primary key (collection_id, account)
);

alter table BookComment add constraint FK_BookComment_user foreign key (account)
      references User (account);

alter table BookComment add constraint FK_Book_comments foreign key (ISBN)
      references Book (ISBN);

alter table MsgLeft add constraint FK_User_msg foreign key (account)
      references User (account);

alter table Orders add constraint FK_Sale_order foreign key (sale_id)
      references Sale (sale_id);

alter table Orders add constraint FK_User_order foreign key (account)
      references User (account);

alter table Post add constraint FK_Post_user foreign key (account)
      references User (account);

alter table PostComment add constraint FK_PostComment_user foreign key (account)
      references User (account);

alter table PostComment add constraint FK_Post_comments foreign key (post_id)
      references Post (post_id);

alter table Sale add constraint FK_SellBook foreign key (ISBN)
      references Book (ISBN);

alter table SaleComment add constraint FK_SaleComment_user foreign key (account)
      references User (account);

alter table SaleComment add constraint FK_Sale_comments foreign key (sale_id)
      references Sale (sale_id);

alter table User_colection add constraint FK_User_colection foreign key (collection_id)
      references CollectedLink (collection_id);

alter table User_colection add constraint FK_User_colection2 foreign key (account)
      references User (account);
