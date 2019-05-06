/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/5/6 19:56:29                            */
/*==============================================================*/




drop table if exists BookComment;

drop table if exists CollectedLink;

drop table if exists PersonalCenter;

drop table if exists PostComment;

drop table if exists SaleComment;

drop table if exists Sale;

drop table if exists BookOrder;

drop table if exists Post;

drop table if exists Book;

drop table if exists User;

/*==============================================================*/
/* Table: Book                                                  */
/*==============================================================*/
create table Book
(
   book_id              int not null,
   user_id              int,
   book_name            varchar(50),
   author               varchar(50),
   introduction         varchar(500),
   score                int,
   type                 int,
   primary key (book_id)
);

/*==============================================================*/
/* Table: BookComment                                           */
/*==============================================================*/
create table BookComment
(
   book_comment_id      int not null,
   user_id              int,
   book_id              int,
   time                 int,
   content              varchar(10000),
   like_number          int,
   reply_to             int,
   primary key (book_comment_id)
);

/*==============================================================*/
/* Table: CollectedLink                                         */
/*==============================================================*/
create table CollectedLink
(
   collection_id        int not null,
   user_id              int,
   link                 varchar(500),
   link_name            varchar(100),
   primary key (collection_id)
);

alter table CollectedLink comment 'ÊÕ²Ø';

/*==============================================================*/
/* Table: "Order"                                               */
/*==============================================================*/
create table BookOrder
(
   order_id             int not null,
   user_id              int,
   time                 int,
   recv_address         varchar(100),
   purchase_num         int,
   primary key (order_id)
);

/*==============================================================*/
/* Table: PersonalCenter                                        */
/*==============================================================*/
create table PersonalCenter
(
   msg_id               int not null,
   user_id              int,
   time                 int,
   content              varchar(10000),
   primary key (msg_id)
);

alter table PersonalCenter comment 'ÁôÑÔ';

/*==============================================================*/
/* Table: Post                                                  */
/*==============================================================*/
create table Post
(
   post_id              int not null,
   user_id              int,
   time                 int,
   title                varchar(50),
   content              varchar(10000),
   like_number          int,
   type                 int,
   primary key (post_id)
);

/*==============================================================*/
/* Table: PostComment                                           */
/*==============================================================*/
create table PostComment
(
   p_comment_id         int not null,
   post_id              int,
   user_id              int,
   time                 int,
   content              varchar(10000),
   like_number          int,
   reply_to             int,
   primary key (p_comment_id)
);

/*==============================================================*/
/* Table: Sale                                                  */
/*==============================================================*/
create table Sale
(
   sale_id              int not null,
   order_id             int,
   book_id              int,
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
   sale_id              int,
   user_id              int,
   time                 int,
   content              varchar(10000),
   like_number          int,
   reply_to             int,
   primary key (s_comment_id)
);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   user_id              int not null,
   password             int,
   nickname             varchar(25),
   avatar               longblob,
   score                int,
   introduction         varchar(500),
   primary key (user_id)
);

alter table Book add constraint FK_user_book foreign key (user_id)
      references User (user_id);

alter table BookComment add constraint FK_book_comment foreign key (book_id)
      references Book (book_id);

alter table BookComment add constraint FK_user_book_comment foreign key (user_id)
      references User (user_id);

alter table CollectedLink add constraint FK_user_collection foreign key (user_id)
      references User (user_id);

alter table BookOrder add constraint FK_user_order foreign key (user_id)
      references User (user_id);

alter table PersonalCenter add constraint FK_user_personal_center foreign key (user_id)
      references User (user_id);

alter table Post add constraint FK_user_post foreign key (user_id)
      references User (user_id);

alter table PostComment add constraint FK_post_comment foreign key (post_id)
      references Post (post_id);

alter table PostComment add constraint FK_user_post_comment foreign key (user_id)
      references User (user_id);

alter table Sale add constraint FK_book_sale foreign key (book_id)
      references Book (book_id);

alter table Sale add constraint FK_order_sale foreign key (order_id)
      references BookOrder (order_id);

alter table SaleComment add constraint FK_sale_comment foreign key (sale_id)
      references Sale (sale_id);

alter table SaleComment add constraint FK_user_sale_comment foreign key (user_id)
      references User (user_id);

