<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="UI.Views.Master.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
      <link type="text/css" rel="stylesheet" href="../../Master.CSS/master.css" />
  <link rel="stylesheet" href="../../bootstrap5/css/bootstrap.min.css" />
  <script src="../../bootstrap5/js/bootstrap.min.js"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar fixed-top">
      <div class="navbar-left  ">
          <div class="navbar-left-login">
              <div class="nav-item-left">
                  <a href="#">
                      <img src="../Image/20150126213929.jpg" height="30"/>
                  </a>
              </div>
              <div class="nav-item-right">
                  <a href="#">
                      <i class="fa-solid fa-list"></i>
                  </a>
              </div>
          </div>
      </div>

      <div class="navbar-right">
          <div class="navbar-right-quitlogin">
              <a class="nav-link collapsed" data-bs-toggle="collapse" data-bs-target="#demo2">
                  <img src="./img/20150126213929.jpg" height="30" />
                  <span>高顺昆</span>
                  <i class="fa-solid fa-chevron-down"></i>
              </a>
              <div id="demo2" class="collapse">
                  <ul class="nav flex-column sub-menu">
                      <li class="nav-item">
                          <a class="nav-link xiala">
                              <i class="fa-solid fa-pen"></i>
                              <span>编辑资料</span>

                          </a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link xiala">
                              <i class="fa-solid fa-arrow-up-right-from-square"></i>
                              <span>退出登录</span>
                          </a>
                      </li>

                  </ul>
              </div>
          </div>
      </div>
  </div>

  <div class="Main">

      <div class="sidebar">
          <ul class="nav">
              <li class="nav-item">
                  <a class="nav-link collapsed" data-bs-toggle="collapse" data-bs-target="#demo">
                      <i class="fa-solid fa-folder"></i>

                      <span class="menu-title">基础信息</span>
                      <i class="fa-solid fa-chevron-down"></i>
                  </a>
                  <div id="demo" class="collapse">
                      <ul class="nav flex-column sub-menu">
                          <li class="nav-item">
                              <a class="nav-link xiala">
                                  <i class="fa-solid fa-user"></i>
                                  <span>业主信息</span>

                              </a>
                          </li>
                          <li class="nav-item">
                              <a class="nav-link xiala">
                                  <i class="fa-solid fa-car"></i>
                                  <span>车辆管理</span>
                              </a>
                          </li>
                          <li class="nav-item">
                              <a class="nav-link xiala">
                                  <i class="fa-solid fa-house"></i>
                                  <span>房产档案</span>

                              </a>
                          </li>
                      </ul>
                  </div>
              </li>
              <li class="nav-item">
                  <a class="nav-link noxia">
                      <i class="fa-solid fa-comment-dollar"></i>
                      <span class="menu-title">物业管理</span>
                      <span></span>
                  </a>
              </li>
              <li class="nav-item">
                  <a class="nav-link noxia">
                      <i class="fa-solid fa-hammer"></i>
                      <span class="menu-title">报修管理</span>
                      <span></span>
                  </a>
              </li>
              <li class="nav-item">
                  <a class="nav-link collapsed" data-bs-toggle="collapse" data-bs-target="#demo1">
                      <i class="fa-solid fa-folder"></i>

                      <span class="menu-title">公告通知</span>
                      <i class="fa-solid fa-chevron-down"></i>
                  </a>
                  <div id="demo1" class="collapse">
                      <ul class="nav flex-column sub-menu">
                          <li class="nav-item">
                              <a class="nav-link xiala">
                                  <i class="fa-solid fa-pen-nib"></i>
                                  <span>公告编写</span>

                              </a>
                          </li>
                          <li class="nav-item">
                              <a class="nav-link xiala">
                                  <i class="fa-solid fa-clipboard"></i>
                                  <span>公告记录</span>
                              </a>
                          </li>

                      </ul>
                  </div>
              </li>
              <li class="nav-item">
                  <a class="nav-link noxia">
                      <i class="fa-solid fa-person"></i>
                      <span class="menu-title">访客记录</span>
                      <span></span>
                  </a>
              </li>
              <li class="nav-item">
                  <a class="nav-link noxia">
                      <i class="fa-solid fa-pen"></i>
                      <span class="menu-title">投诉建议</span>
                      <span></span>
                  </a>
              </li>
          </ul>
      </div>

  </div>

    </form>
</body>
</html>
