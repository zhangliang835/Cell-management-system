<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Common.Master" AutoEventWireup="true" CodeBehind="BingXiang.aspx.cs" Inherits="UI.Views.ShangmenfuwuUI.BingXiang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
          <link rel="stylesheet" href="../../Master.CSS/shangmen.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <div style="overflow-y: auto; max-height: 93vh;">
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

        <div style="background-color: white; padding-top: 20px; margin-top: 20px;">
            <i class="fa-solid fa-bolt-lightning"></i>
            <span>随叫随到 最快一小时上门</span>
            <div class="xuanxiang">
                <div class="xuanxiang2">
                    <div class="aa">单/双开门冰箱</div>
                    <div class="jiage">￥125</div>
                </div>
                <div class="xuanxiang2">

                    <div  class="aa">三开门冰箱</div>
                    <div class="jiage">￥145</div>
                </div>
                <div class="xuanxiang2">
                    <div  class="aa">对开门冰箱</div>
                    <div class="jiage">￥165</div>
                </div>
           

            </div>
        </div>

        <div style="background-color: white; padding-top: 20px; padding-bottom: 10px; box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);">
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
                    <asp:Label ID="JIAGE" runat="server" CssClass="jiage" Text="￥0.0"></asp:Label>
                     <label class="jiage">元/台</label>

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
            <div>
                <label>服务内容</label>
            </div>
            <div class="ziti">
                <label>服务项目：冰箱清洗
</label>
                <br />
                服务内筒：冰箱除味、冰箱内部除霜除水、冰箱内外擦拭清洗、高温蒸汽消毒
            </div>
          
            
            <div style="margin-top: 30px;">
                <label>服务时长说明：</label>
            </div>
             <div class="ziti">
            预计每台冰箱清洗时长不低于60分钟，具体时长与冰箱机型，洁净程度有关，具体时间以实际服务情况为准
             </div>
            <div style="margin-top: 30px;">
                <label>服务退款规则</label>
            </div>
            <div class="ziti">
                <label>
                    亲爱的用户，为保障服务人员的时间效益，如果在服务开始前60分钟内取消订单，可能扣除您订单金额的一定比例数额，如订单使用了优惠券，取消
后优惠券将退还您的帐户。恳请您谅解！
                </label>
            </div>
            <div style="color: red; font-weight: 800; font-size: 12px;">具体规则如下：</div>
            <div class="ziti">
                1.服务前60分钟之外取消，退还100%支付金额。
                <br />
                2.服务开始前0-60分钟内取消且服务人员已接单：
                  <br />
                · 若为您个人原因，平台将扣除支付金额的20%（最多扣除30元），剩余金额将原路退还
  <br />
                · 若为门店原因，平台将在24小时内完成核实，核实通过后，在1~3个工作日内原路退还全额
                  <br />
                3.服务开始后，若您因服务质量问题与服务人员产生争议，请联系客服进行处理。联系电话：

10086
            </div>
        </div>
    </div>
    <asp:HiddenField ID="SelectedServiceName" runat="server" Value="" />
<asp:HiddenField ID="SelectedPrice" runat="server" Value="" />
   <script>


       $(document).ready(function () {
           $('.xuanxiang2').click(function () {
               // 获取当前选中的服务名称和价格
               var serviceNameElement = $(this).find('.aa');
               var priceElement = $(this).find('.jiage');

               // 获取文本内容
               var serviceNameText = serviceNameElement.text();
               var priceText = priceElement.text(); // 将中文货币符号替换为美元符号以匹配JIAVE标签

               // 修改ASP.NET服务器端标签内容
               $('#<%= Xiangmu.ClientID %>').text(serviceNameText);
               $('#<%= JIAGE.ClientID %>').text(priceText);
               $('#<%= SelectedServiceName.ClientID %>').val(serviceNameText);
               $('#<%= SelectedPrice.ClientID %>').val(priceText); 
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
