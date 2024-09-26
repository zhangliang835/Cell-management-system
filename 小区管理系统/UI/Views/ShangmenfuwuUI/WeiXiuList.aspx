<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Common.Master" AutoEventWireup="true" CodeBehind="WeiXiuList.aspx.cs" Inherits="UI.Views.ShangmenfuwuUI.WeiXiuList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../Master.CSS/shangmen.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="overflow-y: auto; max-height: 93vh;">
        <style>
            .liebiao {
                width: 100%;
                height: auto;
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;
                margin-top:10px;
            }

            .danyaun {
                display: flex;
                align-items: center;
                justify-content: center;
                margin-right: 10px;
              
                font-family:'黑体'
            }

            .aa:hover {
                color: red;
            }
            .bb{
              margin-right:0px!important;
              font-size:18px;
              font-weight:800;
            }
            .dd{
                 box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
                   
            }
        </style>
        <div class="daobo">
            <div class="anniu" id="baojieqingxi">
                <a href="../DomesticConsumer/ShangMenFuWu.aspx"><i class="fa-solid fa-brush"></i>&nbsp;&nbsp;上门首页</a>
            </div>
            <div class="anniu">
                <a href="../ShangmenfuwuUI/ShenDu.aspx"><i class="fa-solid fa-droplet"></i>&nbsp;&nbsp;深度清洁</a>
            </div>
            <div class="anniu">
                <a href="../ShangmenfuwuUI/RiChang.aspx"><i class="fa-solid fa-hand-sparkles"></i>&nbsp;&nbsp;日常清洁</a>
            </div>
            <div class="anniu">
                <a><i class="fa-solid fa-shirt"></i>&nbsp;&nbsp;衣物洗护</a>
            </div>
            <div class="anniu">
                <a href="QuanWu.aspx"><i class="fa-solid fa-trash-can"></i>&nbsp;&nbsp;全屋大扫除</a>
            </div>
            <div class="anniu">
                <a href="YouYanJi.aspx"><i class="fa-solid fa-house-chimney"></i>&nbsp;&nbsp;油烟机清洗</a>
            </div>
            <div class="anniu">
                <a href="BingXiang.aspx"><i class="fa-solid fa-icicles"></i>&nbsp;&nbsp;冰箱清洗</a>
            </div>
            <div class="anniu">
                <a href="GuanDao.aspx"><i class="fa-solid fa-timeline"></i>&nbsp;&nbsp;管道疏通</a>
            </div>
            <div class="anniu">
                <a href="WeiXiuList.aspx"><i class="fa-solid fa-hammer"></i>&nbsp;&nbsp;维修服务</a>
            </div>
        </div>
        <div style="background-color: white;margin-top: 20px;">

            <div class="dd">
                
            <span>维修项目列表</span>
            <div class="liebiao">
                <div class="danyaun bb">
                    居室家电：
                </div>
                <div class="danyaun">
                    <div class="aa">
                        空调维修/安装
                    </div>
                </div>
                <div class="danyaun">
                    <div class="aa">电视维修/安装 </div>
                </div>
            </div>
            <div class="liebiao">
                <div class="danyaun bb">
                    家具维修：
                </div>
                <div class="danyaun">
                    <div class="aa">桌子组装/维修</div>
                </div>
                <div class="danyaun">
                    <div class="aa">椅子组装/维修</div>
                </div>
                <div class="danyaun">
                    <div class="aa">床组装/维修</div>
                </div>
                <div class="danyaun">
                    <div class="aa">柜子组装/维修</div>
                </div>
                <div class="danyaun">
                    <div class="aa">沙发组装/维修</div>
                </div>


            </div>
            <div class="liebiao">
                <div class="danyaun bb">
                    电路灯具：
                </div>
                <div class="danyaun">
                    <div class="aa">灯具安装/维修/更换</div>
                </div>
                <div class="danyaun">
                    <div class="aa">电路安装/维修/更换</div>
                </div>
                <div class="danyaun">
                    <div class="aa">开关安装/维修/更换</div>
                </div>
                <div class="danyaun">
                    <div class="aa">插座安装/维修/更换</div>
                </div>


            </div>
            <div class="liebiao">
                <div class="danyaun bb">
                    厨卫家电：
                </div>
                <div class="danyaun">
                    <div class="aa">洗衣机维修/安装</div>
                </div>
                <div class="danyaun">
                    <div class="aa">冰箱维修/安装 </div>
                </div>
                <div class="danyaun">
                    <div class="aa">油烟机维修/安装 </div>
                </div>
                <div class="danyaun">
                    <div class="aa">热水器维修/安装</div>
                </div>
                <div class="danyaun">
                    <div class="aa">燃气灶维修</div>
                </div>

            </div>
            <div class="liebiao">
                <div class="danyaun bb">
                    防水补漏：
                </div>
                <div class="danyaun">
                    <div class="aa">厨房防水/检测/维修</div>
                </div>
                <div class="danyaun">
                    <div class="aa">卫生间防水/检测/维修</div>
                </div>
                <div class="danyaun">
                    <div class="aa">阳台防水/检测/维修</div>
                </div>
                <div class="danyaun">
                    <div class="aa">窗台防水/检测/维修</div>
                </div>
                <div class="danyaun">
                    <div class="aa">外墙防水/检测/维修</div>
                </div>

            </div>
            <div class="liebiao">
                <div class="danyaun bb">
                    门窗挂件：
                </div>
                <div class="danyaun">
                    <div class="aa">门安装/维修</div>
                </div>
                <div class="danyaun">
                    <div class="aa">窗、玻璃安装/维修 </div>
                </div>
                <div class="danyaun">
                    <div class="aa">窗帘杆安装/打孔/维修 </div>
                </div>
                <div class="danyaun">
                    <div class="aa">窗帘杆轨道/打孔/维修</div>
                </div>
                <div class="danyaun">
                    <div class="aa">电动窗帘/打孔/维修</div>
                </div>
                <div class="danyaun">
                    <div class="aa">纱窗安装/维修/更换</div>
                </div>

            </div>
            <div class="liebiao">
                <div class="danyaun bb">
                    地面墙体：
                </div>
                <div class="danyaun">
                    <div class="aa">墙面修补/粉刷/翻新/刮大白</div>
                </div>
                <div class="danyaun">
                    <div class="aa">顶吊修补/安装 </div>
                </div>
                <div class="danyaun">
                    <div class="aa">木地板安装/修补/拆除 </div>
                </div>
                <div class="danyaun">
                    <div class="aa">大理石安装/修补/拆除/美缝</div>
                </div>
                <div class="danyaun">
                    <div class="aa">地暖安装/修补/拆除</div>
                </div>
                <div class="danyaun">
                    <div class="aa">踏脚线安装/修补/拆除</div>
                </div>

            </div>
            <div class="liebiao">
                <div class="danyaun bb">
                    厨卫洁具：
                </div>
                <div class="danyaun">
                    <div class="aa">水管安装/维修</div>
                </div>
                <div class="danyaun">
                    <div class="aa">水龙头安装/维修 </div>
                </div>
                <div class="danyaun">
                    <div class="aa">马桶、蹲便器、小便池安装/维修 </div>
                </div>
                <div class="danyaun">
                    <div class="aa">洗漱台安装/维修</div>
                </div>
                <div class="danyaun">
                    <div class="aa">换气扇安装/维修</div>
                </div>
                <div class="danyaun">
                    <div class="aa">浴缸安装/维修</div>
                </div>
                <div class="danyaun">
                    <div class="aa">沐浴花洒维修/安装/更换</div>
                </div>
                <div class="danyaun">
                    <div class="aa">浴室柜安装/维修/更换拆除</div>
                </div>

            </div>



            </div>


        </div>

        <div style="background-color: white; padding-top: 20px; padding-bottom: 10px; margin-top:20px; box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);">
            <div class="form-group">
                <label for="area"><i class="fa-solid fa-street-view" style="font-size: 20px; color: black"></i></label>
                <div class="xinxi" id="area" style="position: relative;">
                    <asp:Label ID="Area1" runat="server" Text="地址信息"></asp:Label>
                    <label style="position: absolute; right: 0px; top: 50%; transform: translateY(-50%);">
                        <i class="fa-solid fa-arrow-right"></i>
                    </label>
                    <hr style="margin-top: -10px; margin-right: 0;" />
                </div>
            </div>
            <div class="form-group">
                <label for="time"><i class="fa-solid fa-clock-rotate-left" style="font-size: 20px; color: black"></i></label>
                <div class="xinxi" id="time" style="position: relative;">
                    <asp:Label ID="Time1" runat="server" Text="上门时间"></asp:Label>
                    <label style="position: absolute; right: 0px; top: 50%; transform: translateY(-50%);">
                        <i class="fa-solid fa-arrow-right"></i>
                    </label>
                    <hr style="margin-top: -10px; margin-right: 0;" />
                </div>
            </div>
            <div class="form-group">
                <label for="time"><i class="fa-solid fa-wallet" style="font-size: 20px; color: black"></i></label>
                <div class="xinxi" id="xiangmu" style="position: relative;">


                    <asp:Label ID="Xiangmu" runat="server" Text="请选择服务项目"></asp:Label>
                    <label class="jiage">￥9元起</label>


                    <label style="position: absolute; right: 0px; top: 50%; transform: translateY(-50%);">
                        <i class="fa-solid fa-arrow-right"></i>
                    </label>
                    <hr style="margin-top: -10px; margin-right: 0;" />
                </div>
            </div>
            <div class="form-group">
                <label for="beizhu"><i class="fa-regular fa-message" style="font-size: 20px; color: black"></i></label>
                <div class="xinxi" style="position: relative;">

                    <asp:TextBox ID="BeiZhu" runat="server" placeholder="备注" CssClass="form-control custom-textbox"></asp:TextBox>
                    <label style="position: absolute; right: 0px; top: 50%; transform: translateY(-50%);">
                        <i class="fa-solid fa-arrow-right"></i>
                    </label>
                    <hr style="margin-top: 0px; margin-right: 0;" />
                </div>
            </div>

            <asp:Button ID="yvyue" runat="server" Text="立即预约 " CssClass=" yvyue" OnClick="yvyue_Click"/>
        </div>
                <%-- 地址模态框 --%>
        <div class="modal fade custom-modal-position" id="myModa3" tabindex="-1" role="dialog" aria-labelledby="myModalLabe3" aria-hidden="true">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabe3">地址信息</h4>
                    </div>
                    <div class="modal-body">


                        <div class="form-group">
                            <label>地址：</label>
                            <asp:TextBox ID="AREA" runat="server" CssClass="form-control custom-textbox"></asp:TextBox>
                            <label style="position: absolute; right: 10px; top: 16%; transform: translateY(-50%);">
                                <i class="fa-solid fa-arrow-right"></i>
                            </label>
                        </div>
                        <hr style="margin-top: -30px; margin-right: 0;" />

                        <div class="form-group">
                            <label class="control-label">姓名：</label>
                            <asp:TextBox ID="Peple" runat="server" CssClass="form-control custom-textbox"></asp:TextBox>
                            <label style="position: absolute; right: 10px; top: 47%; transform: translateY(-50%);">
                                <i class="fa-solid fa-arrow-right"></i>
                            </label>
                        </div>
                        <hr style="margin-top: -30px; margin-right: 0;" />
                        <div class="form-group">
                            <label class="control-label">电话：</label>
                            <asp:TextBox ID="Phone" runat="server" CssClass="form-control custom-textbox"></asp:TextBox>
                            <label style="position: absolute; right: 10px; top: 75%; transform: translateY(-50%);">
                                <i class="fa-solid fa-arrow-right"></i>
                            </label>
                        </div>
                        <hr style="margin-top: -30px; margin-right: 0;" />
                    </div>
                    <div class="modal-footer" style="display: flex; justify-content: center; align-items: center;">
                        <asp:Button ID="baocunarea" runat="server" Text="保存地址" CssClass="btn btn-primary" OnClick="baocunarea_Click" />

                    </div>
                </div>
            </div>
        </div>
        <%-- 时间模态框 --%>
        <div class="modal fade custom-modal-position" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">请选择上门时间</h4>

                    </div>
                    <div class="modal-body">
                        <p>服务开始1小时之前可免费修改时间</p>
                        <label for="上门时间">上门时间:</label>

                        <asp:TextBox ID="shangmenshijian" runat="server" type="datetime-local"></asp:TextBox>
                    </div>
                    <div class="modal-footer" style="display: flex; justify-content: center; align-items: center;">
                        <asp:Button ID="baocuntime" runat="server" Text="确认" CssClass="btn btn-primary" OnClick="baocuntime_Click" />

                    </div>
                </div>
            </div>
        </div>
        <%-- 提示模态框 --%>
                <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModal2Label">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">                 
                    </div>
                    <div class="modal-body">
                        <p>预约成功，请您保持通话联系！</p>
                        
                    </div>
                    <div class="modal-footer" style="display: flex; justify-content: center; align-items: center;">
                        <asp:Button ID="Button1" runat="server" Text="确认" CssClass="btn btn-primary" OnClick="baocuntime_Click" />

                    </div>
                </div>
            </div>
        </div>
            <div class="mowei">
     
        

        <div style="margin-top: 20px;">
            <label>服务通知</label>
        </div>
        <div class="ziti">
            <label>
            服务人员上门后，因用户原因取消服务，用户已支付的9.9元预付金将作为上门费不予退还;如已提供检测服务的，用户需按照与服务人员提前沟通确认的金额，线上支付检测费用;
            </label>
        </div>     <div class="ziti">
            <label>
          疏通服务过程中，如需提供管道、零配件等材料，需与服务人员提前协商进行补加费用;
            </label>
        </div>
   
    </div>
    </div>
        <asp:HiddenField ID="SelectedServiceName" runat="server" Value="" />
<asp:HiddenField ID="SelectedPrice" runat="server" Value="9" />
    <script>


        $(document).ready(function () {
            $('.danyaun').click(function () {
                // 获取当前选中的服务名称和价格
                var serviceNameElement = $(this).find('.aa');


                // 获取文本内容
                var serviceNameText = serviceNameElement.text();


                // 修改ASP.NET服务器端标签内容
                $('#<%= Xiangmu.ClientID %>').text(serviceNameText);
                $('#<%= SelectedServiceName.ClientID %>').val(serviceNameText);

           });
       });



        $('#area').on('click', function (e) {
            e.preventDefault();
            $('#myModa3').modal('show');
        });
        $('#time').on('click', function (e) {
            e.preventDefault();
            $('#myModal').modal('show');
        });
    </script>
</asp:Content>
