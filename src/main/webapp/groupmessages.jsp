<%@page import="java.util.Vector"%>
<%@page import="sti.classes.User"%>
<!DOCTYPE html>
<html>

<head>
    <title>MESSAGES PAGE</title>
    <style>
        #top {
            top: 0%;
            left: 0%;
            width: 100%;
            height: 80px;
            background: var(--unnamed-color-267dff) 0% 0% no-repeat padding-box;
            background: #267DFF 0% 0% no-repeat padding-box;
            opacity: 1;
        }
        
        #sti {
            position: relative;
            top: 25%;
            left: 8.44%;
            width: 2.81%;
            height: 50%;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) 32px/38px var(--unnamed-font-family-museo-slab-500);
            letter-spacing: var(--unnamed-character-spacing-0);
            color: var(--unnamed-color-ffffff);
            text-align: left;
            font: normal normal normal 32px/38px Roboto;
            letter-spacing: 0px;
            color: #FFFFFF;
            opacity: 1;
        }
        
        #llogout {
            position: relative;
            top: 20%;
            left: 85.20%;
            height: 40%;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) var(--unnamed-font-size-22)/var(--unnamed-line-spacing-27) var(--unnamed-font-family-roboto);
            letter-spacing: var(--unnamed-character-spacing-0-44);
            color: var(--unnamed-color-ffffff);
            text-align: left;
            font: normal normal normal 22px/27px Museo Slab 500;
            letter-spacing: 0.44px;
            color: #FFFFFF;
            text-transform: capitalize;
            opacity: 1;
        }
        
        #middle {
            position: absolute;
            left: 8.44%;
            top: 24%;
            width: 83.12%;
            height: 6%;
            background: var(--unnamed-color-267dff) 0% 0% no-repeat padding-box;
            background: white 0% 0% no-repeat padding-box;
            opacity: 1;
        }
        
        #members {
            position: relative;
            top: 20%;
            left: 3.38%;
            height: 40%;
        }
        
        #files {
            position: relative;
            top: 20%;
            left: 8.16%;
            height: 40%;
        }
        
        #messages {
            position: relative;
            top: 20%;
            left: 13.16%;
            height: 40%;
        }
        
        .focus {
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-medium) 24px/11px var(--unnamed-font-family-roboto);
            letter-spacing: var(--unnamed-character-spacing-0);
            color: var(--unnamed-color-267dff);
            font: normal normal medium 24px/11px Roboto;
            letter-spacing: 0px;
            color: #267DFF;
            opacity: 1;
        }
        
        .unfocus {
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) 24px/11px var(--unnamed-font-family-roboto);
            letter-spacing: var(--unnamed-character-spacing-0);
            font: normal normal medium 24px/11px Roboto;
            letter-spacing: 0px;
            color: #616161;
            opacity: 1;
        }
        .text-action,
        input[type="submit"] {
            cursor: pointer;
        }
        
         #indicator {
            position: absolute;
            top: 52%;
            left: 21.5%;
            border: 1px solid #267DFF;
            opacity: 1;
            width: 6%;
        }
        
        .messagediv {
            display: inline-block;
            position: absolute;
            left: 8.44%;
            top:33%;
            max-width: 50%;
            border-radius: 8px;
            height:15%;
            background: #88838347 0% 0% no-repeat padding-box;
            opacity: 1;
        }
        
        .pic {
            position: relative;
            left: 0%;
            top: 5%;
            width: 40px;
            height: 40px;
            border-radius: 20px;
            background: transparent url('homepage.jpg') 0% 0% no-repeat padding-box;
            opacity: 1;
        }
        
        .content {
            display:inline-block;
            position: relative;
            top: -38%;
            left: 50px;
            height: 19.38%;
            max-width: 80%;
            margin-right: 20px;
            word-break: normal;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) 14px/19px var(--unnamed-font-family-roboto);
            letter-spacing: var(--unnamed-character-spacing-0);
            color: var(--unnamed-color-267dff);
            text-align: left;
            font: normal normal medium 14px/19px Roboto;
            letter-spacing: 0px;
            color: #000000;
            opacity: 1;
        }
        
        .sender {
            display:inline-block;
            position: relative;
            top: -26%;
            left: 1.3%;
            height: 36.73%;
            max-width: 80%;
            margin-right: 20px;
            word-break: normal;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) 16px/20px 
            var(--unnamed-font-family-roboto);
            letter-spacing: var(--unnamed-character-spacing-0);
            text-align: left;
            font: normal normal medium 16px/20px Roboto;
            letter-spacing: 0px;
            color: #267DFF;
            opacity: 1;
            
        }
        #sendmessageform{
            position:fixed;
            top: 91.48%;
            left: 8.44%;
            width: 75.76%;
            height: 5%;
            background: white 0% 0% no-repeat padding-box;
        }
        #messageinput{
            position: relative;
            top:0%;
            left:0%;
            height: 100%;
            width: 90%;
            height: 100%;
            background-color: inherit;
        }
        #messagesend{
            position:relative;
            left:1.98%;
            height: 80%;
            background: var(--unnamed-color-267dff) 0% 0% no-repeat padding-box;
            background: #267DFF 0% 0% no-repeat padding-box;
            border-radius: 5px;
            opacity: 1;
        }
    </style>
    <script>
        function formsubmit(formid)
        {
            var form = document.getElementById(formid);
            form.submit();
            form.reset();
        }
    </script>
</head>

<body>
    <div id="top">
        <span id="sti">STI</span>
        <a href="index.jsp"><span id = "llogout">Logout</span></a>
    </div>
    <div id="middle">
        <span id="members" class="text-action unfocus" onclick="formsubmit('memberform')">Members</span>
        <span id="files" class="text-action unfocus" onclick="formsubmit('filesform')">Files</span>
        <span id="messages" class="text-action focus">Messages</span>
        <br>
        <hr id="indicator" />
    </div>
    <%
        User user = (User) session.getAttribute("user");
        String groupid = (String)session.getAttribute("groupid");
        Vector<String>messages = (Vector<String>)request.getAttribute("messages");
        Vector<Integer>sendernames = (Vector<Integer>)request.getAttribute("sendernames");
        Vector<Integer>senderids = (Vector<Integer>)request.getAttribute("senderids");
        int n = messages.size();
        for(int i=0; i<n; i++)
        {
            String pos = String.valueOf(33+17*i);
            String picturepath = "images/"+senderids.get(i)+".jpg";
    %>
            <div class="messagediv" style="top:<%= pos %>%">
                <img src="<%= picturepath %>" class="pic" />
                <span class="sender"><%= sendernames.get(i) %></span><br />
                <span class="content"><%= messages.get(i) %></span>
            </div>
    <%
        }
    %>
    <form id="sendmessageform" action = "sendmessage" method="post">
        <input type = "hidden" value = "${groupid}" name = "groupid" />
        <input type="text" id = "messageinput" name = "message" placeholder="Type your Message...(max. 100 characters)" />
        <input type="submit" id="messagesend" value="Send" />
    </form>
    <form action="groupinfo" method="post" id="memberform" hidden>
        <input type="text" value = "<%= groupid %>" name="groupid" />
    </form>
    <form action="groupfiles" method="post" id="filesform" hidden>
        <input type="text" value = "<%= groupid %>" name="groupid" />
    </form>
    
</body>

</html>