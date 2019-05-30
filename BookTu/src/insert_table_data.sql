insert into User values(1,"12","小红","",30,"nothing",0);
insert into User values(2,"12","小明","",20,"nothing",0);
insert into User values(3,"12","小东","",0,"nothing",1);
insert into User values(4,"12","小张","",43,"nothing",1);
insert into User values(5,"12","小刘","",20,"nothing",0);


insert into Book values(1,2,"数学建模","姜启源","数学建模比赛专用",20,"交互设计","机械工业出版社");
insert into Book values(2,1,"世间万物","艾米·里奇","动物相遇",30,"小说","南京大学出版社");
insert into Book values(3,4,"一个人生活","谷川俊太郎","日本著名诗人谷川俊太郎年近古稀时的作品",20,"小说","湖南文艺出版社");
insert into Book values(4,3,"皮肤的秘密","[德]耶尔•阿德勒","关于人体最大器官的一切",40,"小说","东方出版社");
insert into Book values(5,5,"建筑师","艾琦","如果人生是一张建筑图纸,属于你的那栋房屋会是什么模样？",35,"小说","北京联合出版公司");


insert into BookComment values(1,2,1,"2019.1.23","牺牲换来的只能是地狱","同学小丁跳楼自杀了，据说是因为他所负责的业务部门被裁撤了。我听到这个消息时，心中五味杂陈。小丁的生活其实令许多人羡慕，他毕业于名校，是某世界百强外企的高管。一家人住在高档小区，房子面积有200平。老婆很漂亮，也很时尚，跟模特似的。他有两个孩子，一儿一女，都在国际学校读小学。小丁对父母很孝顺，把父母从乡下接了过去，住在一起。小丁是村里的成功典型。",20,13);
insert into BookComment values(2,1,3,"2019.3.2","吃得过瘾 写得安逸","毕业于剑桥大学，对约定俗成的“功成名就”兴致寥寥，只对厨房与美食魂牵梦萦。怎么办？",20,13);
insert into BookComment values(3,4,3,"2019.2.4","遇见对的人之前，你得先让自己成为一个对的人","在异乡为异客，唯见快递分外亲。一日三餐靠外卖，喜怒哀乐无问津。",20,13);
insert into BookComment values(4,5,4,"2019.4.5","有些流行小说，一直流行到它们成了经典","比如“绿茶女主套路渣男一般的高帅富男主”、“原配家属大闹小三和渣男婚礼”、“女主祸害备胎多年后又回到渣男怀抱”……",20,13);
insert into BookComment values(5,1,5,"2019.4.6","爱是天时地利的迷信","喜欢乍见之欢，是在阳光的午后穿的那件白衬衫，是操场上那个飞驰而过奔跑的身影。",20,13);

insert into BookCommentReply values(1,2,4,"2019.4.5","对你说的非常有同感");
insert into BookCommentReply values(2,3,4,"2019.4.10","钻石恒久远，一颗永流传");


insert into Message values(1,2,"杂感","2019.5.24","那些让你能说出为什么喜欢的句子真的是你喜欢的吗？");
insert into Message values(2,1,"禁闭岛","2019.5.26","脑叶白质切除手术究竟在救人还是杀人？");
insert into Message values(3,2,"近未来","2019.1.1","热情是刺激欲望必然的反射行为");
insert into Message values(4,1,"语录","2019.5.27","人生很吊诡的那个地方在于，你往往很动心的那个时刻，都是在你还没准备好的时候遇到。当你准备好一切，却很难找回当初动心的那个瞬间了。");
insert into Message values(5,1,"近未来","2019.5.26","<b>你也曾幻想</b>，<i>在无花果树里寻花</i>");


insert into CollectedLink values(1,1,"https://www.baidu.com","百度");
insert into CollectedLink values(2,1,"https://github.com/Zachary-Lei/BookTu","书途");
