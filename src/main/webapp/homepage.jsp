<%@page import="java.util.Vector"%>
<%@page import="sti.classes.User"%>
<!DOCTYPE html>
<html>

<head>
    <title>HOMEPAGE</title>
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
        
        #create-group {
            position: relative;
            top: 20%;
            left: 62.42%;
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
        
        #change-password {
            position: relative;
            top: 20%;
            left: 65.20%;
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
        
        #Logout {
            position: relative;
            top: 20%;
            left: 68.20%;
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
        
        #username {
            display: inline-block;
            position: absolute;
            top: 19%;
            left: 8.44%;
            text-align: center;
            width: 20.05%;
            height: 6.85%;
            background: transparent linear-gradient(101deg, var(--unnamed-color-267dff) 0%, #1966D9 100%) 0% 0% no-repeat padding-box;
            background: transparent linear-gradient(101deg, #267DFF 0%, #1966D9 100%) 0% 0% no-repeat padding-box;
            box-shadow: 5px 5px 10px #267DFF40;
            border-radius: 10px;
        }
        
        .infospan {
            position: relative;
            top: 29.72%;
            width: 53.24%;
            height: 40.56%;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) var(--unnamed-font-size-22)/var(--unnamed-line-spacing-27) var(--unnamed-font-family-roboto);
            letter-spacing: var(--unnamed-character-spacing-0-44);
            color: var(--unnamed-color-ffffff);
            text-align: left;
            font: normal normal normal 22px/27px Museo Slab 500;
            letter-spacing: 0.44px;
            color: #FFFFFF;
            opacity: 1;
        }
        
        #userid {
            display: inline-block;
            position: absolute;
            top: 19%;
            left: 30.20%;
            text-align: center;
            width: 20.05%;
            height: 6.85%;
            background: transparent linear-gradient(101deg, var(--unnamed-color-267dff) 0%, #1966D9 100%) 0% 0% no-repeat padding-box;
            background: transparent linear-gradient(101deg, #267DFF 0%, #1966D9 100%) 0% 0% no-repeat padding-box;
            box-shadow: 5px 5px 10px #267DFF40;
            border-radius: 10px;
        }
        
        #ur-groups {
            position: absolute;
            top: 31.20%;
            left: 8.44%;
            height: 3.6%;
            font: var(--unnamed-font-style-normal) normal 600 32px/39px var(--unnamed-font-family-montserrat);
            letter-spacing: var(--unnamed-character-spacing-0);
            color: var(--unnamed-color-267dff);
            text-align: left;
            font: normal normal 600 32px/39px Montserrat;
            letter-spacing: 0px;
            color: #267DFF;
            opacity: 1;
        }
        
        .inlinediv {
            display: inline-block;
            position: absolute;
            top: 39%;
            width: 20.05%;
            height: 22.87%;
            box-shadow: 3px 3px 6px #267DFF40;
            border-radius: 10px;
            opacity: 1;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        
        #zero {
            position: absolute;
            left: 8.44%;
            background: #257BFD 0% 0% no-repeat padding-box;
        }
        
        #one {
            position: absolute;
            left: 29.32%;
            background: #25C3FD 0% 0% no-repeat padding-box;
        }
        
        #two {
            position: absolute;
            left: 50.26%;
            background: #17CA63 0% 0% no-repeat padding-box;
        }
        
        #three {
            position: absolute;
            left: 71.15%;
            background: #FDBC25 0% 0% no-repeat padding-box;
        }
        
        .groupsubmit,
        form {
            width: 100%;
            height: 100%;
            background-color: inherit;
            border-radius: inherit;
        }
        
        .groupsubmit{
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) 32px/38px var(--unnamed-font-family-museo-slab-500);
            letter-spacing: var(--unnamed-character-spacing-0);
            color: var(--unnamed-color-ffffff);
            text-align: center;
            font: normal normal medium 40px/45px Roboto;
            letter-spacing: 1px;
            color: #FFFFFF;
            opacity:1;
        }
        
        .hiddenform {
            position: absolute;
            top: 21.48%;
            left: 26.41%;
            width: 47.24%;
            height: 57.13%;
            background: var(--unnamed-color-ffffff) 0% 0% no-repeat padding-box;
            background: #FFFFFF 0% 0% no-repeat padding-box;
            border: 1px solid #707070;
            border-radius: 10px;
            opacity: 1;
        }
        
        .formname {
            position: relative;
            top: 11.18%;
            left: 8.45%;
            width: 237px;
            height: 5.18%;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-medium) var(--unnamed-font-size-26)/var(--unnamed-line-spacing-32) var(--unnamed-font-family-montserrat);
            letter-spacing: var(--unnamed-character-spacing-0);
            color: var(--unnamed-color-267dff);
            text-align: left;
            font: normal normal medium 26px/32px montserrat;
            letter-spacing: 0px;
            color: #267DFF;
            opacity: 1;
        }
        
        input[type="text"] {
            position: relative;
            left: 22.72%;
            height: 6%;
            width: 51.8%;
            border: 1px solid;
            border-color: white white black white;
        }
        
        .input1 {
            position: relative;
            top: 10%;
            left: 27.21%;
            width: 45%;
            border: 1px solid;
            border-color: white white black white;
        }
        
        .input2 {
            position: relative;
            top: 20%;
            left: 27.21%;
            width: 45%;
            border: 1px solid;
            border-color: white white black white;
        }
        
        .input3 {
            position: relative;
            top: 30%;
            left: 27.21%;
            width: 45%;
            border: 1px solid;
            border-color: white white black white;
        }
        
        .formsubmit {
            position: relative;
            top: 50.76%;
            left: 30.72%;
            width: 22.05%;
            height: 9.24%;
            background: var(--unnamed-color-267dff) 0% 0% no-repeat padding-box;
            background: #267DFF 0% 0% no-repeat padding-box;
            border-radius: 10px;
            opacity: 1;
            color: white;
            font: normal normal medium 22px/27px Roboto;
        }
        
        .cancel {
            position: relative;
            top: 50.76%;
            left: 22.72%;
            width: 22.05%;
            height: 9.24%;
            background: var(--unnamed-color-267dff) 0% 0% no-repeat padding-box;
            background: #e41a1a 0% 0% no-repeat padding-box;
            border-radius: 10px;
            opacity: 1;
            color: white;
            font: normal normal medium 22px/27px Roboto;
        }
        
        .text-action,
        input[type="submit"] {
            cursor: pointer;
        }
    </style>
    <script>
        function show(formid) {
            var form = document.getElementById(formid);
            form.removeAttribute("hidden");
        }

        function hide(formid) {
            var form = document.getElementById(formid);
            form.reset();
            form.setAttribute("hidden", "hidden");
        }

        function formsubmit(formid)
        {
            var form = document.getElementById(formid);
            form.submit();
            form.reset();
        }
    </script>
</head>

<body>
    <script>
        window.addEventListener("pageshow", function(event){
            var historyTraversal = event.persisted || (typeof window.performance!="undefined" && window.performance.navigation.type===2);
            if(historyTraversal)
                window.location.reload(true);
        });
    </script>
    <%
        User user = (User) session.getAttribute("user");
        Vector<String>groupnames = (Vector<String>)request.getAttribute("groupnames");
        Vector<String>groupids = (Vector<String>)request.getAttribute("groupids");
        int n = groupnames.size();
        System.out.println("homepagejsp: "+user.getId()+" "+user.getPassword()+" "+user.getType());
    %>
    <div id="top">
        <span id="sti">STI</span>
        <%
            if(user.getType().equalsIgnoreCase("Teacher"))
            {
        %>
        <span id="create-group" class="text-action" onclick="show('newgroup')" >Create Group</span>
        <%
            }
        %>
        <span id="change-password" class="text-action" onclick="show('passchange')">Change Password</span>
        <a href="index.jsp"><span id = "Logout">Logout</span></a>
    </div>
    <div id="username"><span class="infospan">Name:${username}</span></div>
    <div id="userid"><span class="infospan">Id:<%= user.getId() %></span></div>

    <span id="ur-groups">Your Groups</span>

    <%
        for(int i=0; i<n; i++)
        {
            String boxid = "box";
            switch(i%4)
            {
                case 0: boxid = "zero";
                        break;
                case 1: boxid = "one";
                        break;
                case 2: boxid = "two";
                        break;
                case 3: boxid = "three";      
            }
    %>
    <div class="inlinediv" id = "<%=boxid%>" >
        <form action = "groupinfo" method = "post">
            <input type = "hidden" value = "<%= String.valueOf(groupids.get(i)) %>" name = "groupid" />
            <input type="submit" class="groupsubmit" value="<%= groupnames.get(i) %>" />
        </form>
    </div>
    <%
        }
    %>
    <form action="changepassword" method="post" id="passchange" class="hiddenform" hidden="hidden">
        <h2>
            <span class="formname">
                Change Password
            </span>
        </h2>
        <input type="password" class="input1" placeholder="Enter Current Password" name = "password"/><br />
        <input type="password" class="input2" placeholder="Re-Enter New Password" name = "newpassword"/><br />
        <input type="password" class="input3" placeholder="Re-Enter New Password" name = "renewpassword"/><br />
        <input type="button" value="Cancel" class="cancel" onclick="hide('passchange')" />
        <input type="button" value="Change" class="formsubmit" onclick="formsubmit('passchange')"/>
    </form>
    <form action="creategroup" method="post" id="newgroup" class="hiddenform" hidden="hidden">
        <h2>
            <span class="formname">
                Create Your Group
            </span>
        </h2>
        <input type="text" class="input2" placeholder="Enter a Name for Your Group" name = "groupname"/><br />
        <input type="button" value="cancel" class="cancel" onclick="hide('newgroup')" />
        <input type="button" value="Create " class="formsubmit" onclick=" formsubmit('newgroup')"/>
    </form>
</body>

</html>