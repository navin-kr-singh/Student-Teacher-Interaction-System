<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>

<head>
    <title>FILES PAGE</title>
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
        
        #indicator {
            position: absolute;
            top: 52%;
            left: 13.5%;
            border: 1px solid #267DFF;
            opacity: 1;
            width: 3.2%;
        }
        
        .filedisplay {
            display: inline-block;
            position: absolute;
            top: 33%;
            left: 8.44%;
            width: 56%;
            height: 7.51%;
            border: 0.5px solid #EBEAEA;
            background-color: rgb(214 68 185);
            border-radius: 8px;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-medium) 18px/22px var(--unnamed-font-family-Museo Slab 500);
            letter-spacing: var(--unnamed-character-spacing-0);
            align-self: left;
            letter-spacing: 0px;
            color: #000000;
            opacity: 1;
        }
        
        .filename {
            position: relative;
            top: 0%;
            left: 0%;
            height: 100%;
            width: 100%;
            border-radius: 8px;
            background-color: inherit;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-medium) 18px/20px var(--unnamed-font-family-roboto);
            letter-spacing: var(--unnamed-character-spacing-0);
            text-align: center;
            font: normal normal medium 18px/20px Roboto;
            letter-spacing: 0px;
            color: #000000;
            opacity: 1;
        }
        
        .download {
            position: relative;
            top: 25.88%;
            left: 68%;
            opacity: 1;
            font-weight: bolder;
            font-size: x-large;
            background-color: #267DFF;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-medium) 18px/20px var(--unnamed-font-family-roboto);
            letter-spacing: var(--unnamed-character-spacing-0);
            text-align: left;
            font: normal normal medium 18px/20px Roboto;
            letter-spacing: 0px;
            color: black;
            opacity: 1;
        }
        
        #fileuploadform {
            position: absolute;
            top: 52.78%;
            left: 70.31%;
            width: 20.88;
            height: 30.46%;
            background: #F8F8F8 0% 0% no-repeat padding-box;
            border: 2px dashed #70707047;
            opacity: 1;
        }
        
        #file-upload {
            position: absolute;
            top: 47.6%;
            left: 73.4%;
            height: 2.96%;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) var(--unnamed-font-size-26)/16px var(--unnamed-font-family-roboto);
            letter-spacing: var(--unnamed-character-spacing-0);
            color: var(--unnamed-color-267dff);
            text-align: left;
            font: normal normal normal 26px/16px Roboto;
            letter-spacing: 0px;
            color: #267DFF;
            opacity: 1;
        }
        
        #choosefile {
            position: relative;
            top: 20%;
            left: 12%;
        }
        
        #uploadbutton {
            position: relative;
            top: 40%;
            left: 28.2%;
            background: var(--unnamed-color-267dff) 0% 0% no-repeat padding-box;
            background: #267DFF 0% 0% no-repeat padding-box;
            border-radius: 5px;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) var(--unnamed-font-size-20)/11px var(--unnamed-font-family-roboto);
            letter-spacing: var(--unnamed-character-spacing-0);
            color: var(--unnamed-color-ffffff);
            text-align: left;
            font: normal normal medium 20px/11px Roboto;
            letter-spacing: 0px;
            color: #FFFFFF;
            opacity: 1;
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
    <div id="top">
        <span id="sti">STI</span>
        <a href="index.jsp"><span id = "llogout">Logout</span></a>
    </div>
    <div id="middle">
        <span id="members" class="text-action unfocus" onclick="formsubmit('memberform')">Members</span>
        <span id="files" class="text-action focus">Files</span>
        <span id="messages" class="text-action unfocus" onclick="formsubmit('messagesform')">Messages</span>
        <br>
        <hr id="indicator" />
    </div>
    <%
        Vector<String>filenames = (Vector<String>)request.getAttribute("filenames");
        Vector<String>fileids = (Vector<String>)request.getAttribute("fileids");
        String groupid = (String) request.getAttribute("groupid");
        System.out.println("groupfiles jsp: groupid = "+groupid);
        int n = filenames.size();
        for(int i=0; i<n; i++)
        {
            String pos = String.valueOf(33+12*i);
    %>
            <form action="fileinfo" class="filedisplay" style="top:<%= pos %>%;" method="post">
                <input type="submit" class="filename" value = "<%= filenames.get(i) %>">
                <input type = "hidden" name = "fileid" value = "<%= fileids.get(i) %>" />
            </form>
    <%
        }
    %>    
    <span id="file-upload">File Upload</span>
    <form id="fileuploadform" action="fileupload" method = "post" enctype="multipart/form-data">
        <input type = "hidden" value = "<%= groupid %>" name = "groupid" />
        <input type="file" name = "uploadfile" id="choosefile"><br>
        <input type="submit" value="   Upload   " id="uploadbutton">
    </form>
    <form action="groupinfo" method="post" id="memberform" hidden>
        <input type="text" value = "<%= groupid %>" name="groupid" />
    </form>
    <form action="groupmessages" method="post" id="messagesform" hidden>
        <input type="text" value = "<%= groupid %>" name="groupid" />
    </form>
</body>

</html>