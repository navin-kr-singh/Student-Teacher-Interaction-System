<%@page import="sti.classes.User"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>

<head>
    <title>GROUP PAGE</title>
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
        
        #teacher {
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
        
        #managegroup {
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
        
        .text-action,
        input[type="submit"] {
            cursor: pointer;
        }
        
        #searchform {
            position: absolute;
            left: 8.44%;
            top: 15.35%;
            width: 83.12%;
            height: 4.07%;
        }
        
        input[name="memberinfo"] {
            position: relative;
            left: 0%;
            width: 90%;
            height: 100%;
        }
        
        #searchsubmit {
            height: 100%;
            width: 8%;
            margin-left: 10px;
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
        
        #indicator {
            position: absolute;
            top: 50%;
            left: 2.8%;
            border: 1px solid #267DFF;
            opacity: 1;
            width: 6.15%;
        }
        
        .memberform {
            position: absolute;
            left: 8.44%;
            width: 82.16%;
            height: 7.31%;
            background: #FAFAFA 0% 0% no-repeat padding-box;
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
        
        .membersubmit {
            height: 100%;
            border-color: white;
            position: absolute;
            top: 0%;
            left: 4%;
            width: 96%;
            background-color: rgb(233, 71, 71);
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-medium) 18px/22px var(--unnamed-font-family-Museo Slab 500);
            letter-spacing: var(--unnamed-character-spacing-0);
            text-align: left;
            font: normal normal medium 18px/22px Museo Slab 500;
            letter-spacing: 0px;
            color: #000000;
            opacity: 1;
        }
        
        #managerdiv {
            display: none;
            position: absolute;
            left: 72%;
            width: 10%;
            height: 16.94%;
            background: #E4F4FF 0% 0% no-repeat padding-box;
            opacity: 1;
        }
        
        #add {
            position: relative;
            top: 6%;
            left: 10%;
            height: 12%;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) 18px/40px var(--unnamed-font-family-Museo Slab 500);
            letter-spacing: var(--unnamed-character-spacing-0);
            color: var(--unnamed-color-267dff);
            text-align: center;
            font: normal normal normal 8px/40px Museo Slab 500;
            letter-spacing: 0px;
            color: #267DFF;
            opacity: 1;
        }
        
        #remove {
            position: relative;
            top: 10%;
            left: 10%;
            height: 12%;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) 18px/40px var(--unnamed-font-family-Museo Slab 500);
            letter-spacing: var(--unnamed-character-spacing-0);
            color: var(--unnamed-color-267dff);
            text-align: center;
            font: normal normal normal 8px/40px Museo Slab 500;
            letter-spacing: 0px;
            color: #267DFF;
            opacity: 1;
        }
        
        #delete {
            position: relative;
            top: 16%;
            left: 10%;
            height: 12%;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) 18px/40px var(--unnamed-font-family-Museo Slab 500);
            letter-spacing: var(--unnamed-character-spacing-0);
            color: var(--unnamed-color-FF262C);
            text-align: center;
            font: normal normal normal 10px/40px Museo Slab 500;
            letter-spacing: 0px;
            color: #FF262C;
            opacity: 1;
        }
        
        #close {
            position: relative;
            top: 22%;
            left: 33%;
            width: 45.16%;
            height: 8%;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) 18px/40px var(--unnamed-font-family-Museo Slab 500);
            letter-spacing: var(--unnamed-character-spacing-0);
            color: var(--unnamed-color-FF262C);
            text-align: center;
            font: normal normal normal 8px/30px Museo Slab 500;
            letter-spacing: 0px;
            color: black;
            opacity: 1;
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
        
        .input2,
        .input3 {
            position: relative;
            left: 22.72%;
            height: 6%;
            width: 51.8%;
            border: 1px solid;
            border-color: white white black white;
        }
        
        .input2 {
            position: relative;
            top: 20%;
            left: 27.21%;
        }
        
        .input3 {
            position: relative;
            top: 30%;
            left: 27.21%;
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
        
        #confirmation {
            position: relative;
            top: 20.4%;
            left: 25.42%;
        }
    </style>
    <script>
        function toggledisplay(elementid) {
            var ele = document.getElementById(elementid);
            if (ele.style.display === 'none')
                ele.style.display = 'inline-block';
            else
                ele.style.display = 'none';
        }

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
        function toggledisplay(divid)
        {
            var div = document.getElementById(divid);
            if(div.style.display==='none')
                div.style.display = 'inline-block';
            else
                div.style.display = 'none';
        }
    </script>
</head>

<body>
    <%
        Vector<String>membernames = (Vector<String>)request.getAttribute("membernames");
        Vector<String>memberids = (Vector<String>)request.getAttribute("memberids");
        String groupid = (String) request.getAttribute("groupid");
        String groupname = (String) session.getAttribute("groupname");
        User user = (User) session.getAttribute("user");
        System.out.println("groupinfo jsp: groupid = "+groupid);
        int n = membernames.size();
    %>
    <div id="top">
        <span id="sti">STI</span>
        <span id="teacher" class="text-action" onclick="formsubmit('teacherform')">Teacher</span>
        <%
            if(user.getType().equalsIgnoreCase("Teacher"))
            {
        %>
        <span id="managegroup" class="text-action" onclick="toggledisplay('managerdiv')">Manage Group</span>
        <%
            }
        %>
        <a href="index.jsp"><span id = "Logout">Logout</span></a>
    </div>
    <form action="searchmember" method="post" id="searchform">
        <input type = "hidden" name = "groupid" value = "${groupid}" />
        <input type="text" placeholder="Enter Name or Unique Id of the Member" name = "memberinfo" />
        <input type="button" value="Search" id="searchsubmit" onclick="formsubmit('searchform')">
    </form>
    <div id="middle">
        <span id="members" class="text-action focus">Members</span>
        <span id="files" class="text-action unfocus" onclick="formsubmit('filesform')">Files</span>
        <span id="messages" class="text-action unfocus" onclick="formsubmit('messagesform')">Messages</span>
        <br>
        <hr id="indicator" />
    </div>
    <%
        for(int i=0; i<n; i++)
        {
            String memberinfo = membernames.get(i);
            String topmargin = String.valueOf(33+12*i);
            while(memberinfo.length()<121)
                memberinfo = memberinfo + " ";
            memberinfo = memberinfo + "Id:"+memberids.get(i);
            for(int j=0; j<121; j++)
                memberinfo = memberinfo + " ";
            memberinfo = memberinfo+"Student";
            String picturepath = "images/"+memberids.get(i)+".jpg";
    %>
            <form action="memberinfo" method="post" class="memberform" style="top:<%= topmargin %>%;">
                <img src="<%= picturepath %>" class="pic" />
                <input type = "hidden" name = "memberid" value = "<%= memberids.get(i) %>" />
                <input type="submit" class="membersubmit" value="<%= memberinfo %>"
                />
            </form>
    <%
            System.out.println("groupinfo jsp: "+memberids.get(i));
        }
    %>
    <div id="managerdiv">
        <span id="add" class = "text-action" onclick="show('addmember')">Add Member</span><br />
        <span id="remove" class = "text-action" onclick="show('removemember')">Remove Member</span><br />
        <span id="delete" class = "text-action" onclick="show('groupdelete')">Delete Group</span><br />
        <span id="close" class = "text-action" onclick="toggledisplay('managerdiv')">Close</span>
    </div>
    <form action="addmember" method="post" id="addmember" class="hiddenform" hidden="hidden">
        <h2>
            <span class="formname">
                Add Member
            </span>
        </h2>
        <input type = "hidden" name = "groupid" value = "<%= groupid %>" />
        <input type="text" class="input2" placeholder="Enter Student Name" name = "studentname"/><br />
        <input type="text" class="input3" placeholder="Enter Student ID" name = "studentid"/><br />
        <input type="button" value="cancel" class="cancel" onclick="hide('addmember')" />
        <input type="button" value="Add" class="formsubmit" onclick="formsubmit('addmember')"/>
    </form>
    <form action="deletemember" method="post" id="removemember" class="hiddenform" hidden="hidden">
        <h2>
            <span class="formname">
                Remove Member
            </span>
        </h2>
        <input type = "hidden" name = "groupid" value = "<%= groupid %>" />
        <input type="text" class="input2" placeholder="Enter Student Name" name = "studentname"/><br />
        <input type="text" class="input3" placeholder="Enter Student ID" name = "studentid"/><br />
        <input type="button" value="Cancel" class="cancel" onclick="hide('removemember')" />
        <input type="button" value="Remove" class="formsubmit" onclick="formsubmit('removemember')"/>
    </form>
    <form action="deletegroup" method="post" id="groupdelete" class="hiddenform" hidden="hidden">
        <h2>
            <span class="formname">
                Delete Group
            </span>
        </h2>
        <span id="confirmation">Are you sure you want to delete group: <%= groupname %>?</span><br />
        <input type = "hidden" name = "groupid" value = "<%= groupid %>" />
        <input type="button" value="Cancel" style="background-color: blanchedalmond;color: black;" class="cancel" onclick="hide('groupdelete')" />
        <input type="submit" value="Delete" style="background-color:#e41a1a;" class="formsubmit" />
    </form>
    <form action = "groupfiles" method="post" hidden="hidden" id="filesform">
        <input class = "top" type = "hidden" name = "groupid" value = "${groupid}"  />
    </form>
    <form action = "groupmessages" method="post" hidden="hidden" id="messagesform">
        <input class = "top" type = "hidden" name = "groupid" value = "${groupid}"  />
    </form>
    <form action = "teacherinfo" method="post" hidden="hidden" id="teacherform">
        <input class = "top" type = "hidden" name = "groupid" value = "${groupid}"  />
    </form>
    
</body>

</html>
