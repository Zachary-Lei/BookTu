insert into User values(1,"12","小红","",30,"nothing",0);
insert into User values(2,"12","小明","",20,"nothing",0);
insert into User values(3,"12","小东","",0,"nothing",1);
insert into User values(4,"12","小张","",43,"nothing",1);
insert into User values(5,"12","小刘","",20,"nothing",0);


insert into Book values(1,2,"数学建模","姜启源","数学建模比赛专用",20,0,"机械工业出版社","算法"," ",69.00,425,9787111277293);
insert into Book values(2,1,"世间万物","艾米·里奇","动物相遇",30,0,"南京大学出版社","教育","精装",58.00,212,9787305213410);
insert into Book values(3,4,"一个人生活","谷川俊太郎","日本著名诗人谷川俊太郎年近古稀时的作品",20,0,"湖南文艺出版社","日本文学"," ",45.00,272,9787540488789);
insert into Book values(4,3,"皮肤的秘密","[德]耶尔•阿德勒","关于人体最大器官的一切",40,0,"东方出版社","健康","平装",59.00,312,9787520705134);
insert into Book values(5,5,"建筑师","艾琦","如果人生是一张建筑图纸,属于你的那栋房屋会是什么模样？",35,0,"北京联合出版公司","励志","精装",198.00,344,9787559620590);

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


insert into Saleable_Books values("9787115428028", "Python编程", "[美]埃里克·马瑟斯",       "人民邮电出版社", 32, 50, "本书是一本针对所有层次的Python 读者而作的Python入门书。");
insert into Saleable_Books values("9787121022982", "代码大全",   "[美] 史蒂夫·迈克康奈尔",  "电子工业出版社", 43, 50, "第2版的《代码大全》是著名IT畅销书作者史蒂夫·迈克康奈尔11年前的经典著作的全新演绎。");
insert into Saleable_Books values("9787115249494", "黑客与画家", "[美] 保罗·格雷厄姆",      "人民邮电出版社", 25, 50, "本书是硅谷创业之父Paul Graham 的文集，主要介绍黑客即优秀程序员的爱好和动机");
insert into Saleable_Books values("9787115447630", "算法图解",   " [美] Aditya Bhargava",   "人民邮电出版社", 40, 50, "本书示例丰富，图文并茂，以让人容易理解的方式阐释了算法，旨在帮助程序员在日常项目中更好地发挥算法的能量。");
