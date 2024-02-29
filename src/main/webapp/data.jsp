<%--
  Created by IntelliJ IDEA.
  User: 10260
  Date: 2024/1/3
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="css/data.css">
<script src="js/tab.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="body-tab">
    <div class="head-data">
        <%@ include file="pubilc/head.jsp"%>
    </div>
    <div class="body_table">
        <div class="body-button">
            <button class="tab active"  onclick="tab(event,'tab1')">成功</button>
            <button class="tab" onclick="tab(event,'tab2')">失败</button>
            <button class="tab" onclick="tab(event,'tab3')">随便</button>
        </div>
        <div id="tab1" class="tab-content" style="display: block">
            <div class="table-style">
                <table>
                    <thead>
                    <tr>
                        <th><div class="tr-th-name">编号</div></th>
                        <th><div class="tr-th-name">用例名</div></th>
                        <th><div class="tr-th-name">用例描述</div></th>
                        <th><div class="tr-th-name">运行时间</div></th>
                        <th><div class="tr-th-name">测试结果</div></th>
                    </tr>
                    </thead>
                    <tbody>
                    <% String[] data = new String[]{"1", "2","3","4","5"};
                        for (String datum : data) {%>
                    <tr>
                        <td><%=datum%>
                        </td>
                        <td><%=datum%>
                        </td>
                        <td><%=datum%>
                        </td>
                        <td><%=datum%>
                        </td>
                        <td><%=datum%>
                        </td>
                    </tr>
                    <%}%>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td>total</td>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
        <div id="tab2" class="tab-content" style="display: none">
            <div class="table-style">
                <table>
                    <thead>
                    <tr>
                        <th><div class="tr-th-name">编号</div></th>
                        <th><div class="tr-th-name">用例名</div></th>
                        <th><div class="tr-th-name">用例描述</div></th>
                        <th><div class="tr-th-name">运行时间</div></th>
                        <th><div class="tr-th-name">测试结果</div></th>
                    </tr>
                    </thead>
                    <tbody>

                    <% String[] data_1 = new String[]{"1", "2","3","4","5"};
                        for(int i=0;i<data_1.length;i++){%>
                    <tr>
                        <td><%=data[i]%></td>
                        <td><%=data[i]%></td>
                        <td><%=data[i]%></td>
                        <td><%=data[i]%></td>
                        <td><%=data[i]%></td>
                    </tr>
                    <%}%>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td>total</td>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
        <div id="tab3" class="tab-content" style="display: none">
            <div class="table-style">
                <table>
                    <thead>
                    <tr>
                        <th><div class="tr-th-name">编号</div></th>
                        <th><div class="tr-th-name">用例名</div></th>
                        <th><div class="tr-th-name">用例描述</div></th>
                        <th><div class="tr-th-name">运行时间</div></th>
                        <th><div class="tr-th-name">测试结果</div></th>
                    </tr>
                    </thead>
                    <tbody>

                    <% String[] data_2 = new String[]{"1", "2","3","4","5"};
                        for(int i=0;i<data_2.length;i++){%>
                    <tr>
                        <td><%=data[i]%></td>
                        <td><%=data[i]%></td>
                        <td><%=data[i]%></td>
                        <td><%=data[i]%></td>
                        <td><%=data[i]%></td>
                    </tr>
                    <%}%>

                    </tbody>
                    <tfoot>
                    <tr>
                        <td>total</td>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
    <div class="bottom_show">
        <%@ include file="pubilc/bottom.jsp"%>
    </div>
</div>
</body>
</html>
