/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/5/6 19:56:29                            */
/*==============================================================*/

use booktu;


drop table if exists BookCommentReply;

drop table if exists BookComment;

drop table if exists CollectedLink;

drop table if exists PostComment;

drop table if exists SaleComment;

drop table if exists Sale;

drop table if exists BookOrder;

drop table if exists Post;

drop table if exists Book;

drop table if exists Resources;

drop table if exists Message;

drop table if exists User;

drop table if exists Saleable_Books;

drop table if exists Order_records;

/*==============================================================*/
/* Table: Book                                                  */
/*==============================================================*/
create table Book
(
   book_id              int not null,
   user_id              int,
   book_name            varchar(50),
   author               varchar(50),
   introduction         varchar(1000),
   score                int,
   type                 int,
   publishing_house     varchar(50),
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
   time                 varchar(255),
   title                varchar(50),
   content              varchar(10000),      
   like_number          int,
   reply_to             int,
   primary key (book_comment_id)
);


create table BookCommentReply
(
	book_comment_reply_id int not null,
    user_id               int,
    book_comment_id       int,
    time                  varchar(255),
    content               varchar(1000),
    primary key (book_comment_reply_id)
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
   time                 varchar(255),
   recv_address         varchar(100),
   purchase_num         int,
   primary key (order_id)
);

/*==============================================================*/
/* Table: Post                                                  */
/*==============================================================*/
create table Post
(
   post_id              int not null,
   user_id              int,
   time                 varchar(255),
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
   time                 varchar(255),
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
   time                 varchar(255),
   content              varchar(10000),
   like_number          int,
   reply_to             int,
   primary key (s_comment_id)
);

/*==============================================================*/
/* Table: Resources                                          */
/*==============================================================*/
create table if not exists Resources
(
   resource_id      int not null,
   user_id          int,
   resource_name    varchar(255),
   description      varchar(255),
   filename       varchar(255),
   time					varchar(255),
   primary key (resource_id)
);



/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   user_id              int not null,
   password             varchar(20),
   nickname             varchar(25),
   avatar               longblob,
   score                int,
   introduction         varchar(500),
   user_type            int,
   primary key (user_id)
);

/*==============================================================*/
/* Table: Message                                               */
/*==============================================================*/
create table Message
(
   message_id           int not null auto_increment,
   user_id              int,
   title                varchar(100),
   time                 varchar(255),
   content              varchar(500),
   primary key (message_id)
);

/*==============================================================*/
/* Table: Saleable_Books                                        */
/*==============================================================*/
create table Saleable_Books
(
   isbn              	char(13),
   book_name            varchar(50),
   author               varchar(50),
   publishing_house     varchar(50),
   price                int,
   introduction         varchar(500),
   primary key (isbn)
);

/*==============================================================*/
/* Table: Order_records                                         */
/*==============================================================*/
create table Order_records
(
   order_id             int not null,
   user_id				int,
   commitdate           varchar(50),
   totalprice			int,
   reciever             varchar(50),
   phone				char(11),
   message				varchar(100),
   country				varchar(10),
   rec_address          varchar(50),
   primary key (order_id)
);

alter table Resources add constraint FK_user_resource foreign key (user_id)
      references User (user_id);

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
      
alter table BookCommentReply add constraint FK_user_book_comment_reply foreign key (user_id)
      references User (user_id);
     
alter table BookCommentReply add constraint FK_book_comment_book_comment_reply foreign key (book_comment_id)
      references BookComment (book_comment_id);

alter table Message add constraint FK_user_message foreign key (user_id)
      references User (user_id);

