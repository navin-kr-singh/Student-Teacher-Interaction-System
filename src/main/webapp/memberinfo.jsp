<%@page import="sti.classes.User"%>
<!DOCTYPE html>
<html>
<head>
    <title>MEMBER INFO PAGE</title>
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
        
        #pic {
            position: absolute;
            left: 8.44%;
            top: 27.5%;
            width: 70px;
            height: 70px;
            border-radius: 35px;
            background: transparent url('homepage.jpg') 0% 0% no-repeat padding-box;
            opacity: 1;
        }
        
        #dept {
            position: absolute;
            top: 33.1%;
            left: 15%;
            height: 2.22%;
            max-width: 90%;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) var(--unnamed-font-size-20)/var(--unnamed-line-spacing-24) var(--unnamed-font-family-roboto);
            letter-spacing: var(--unnamed-character-spacing-0-4);
            text-align: left;
            font: normal normal small 20px/24px Roboto;
            letter-spacing: 0.4px;
            color: #616161;
            opacity: 1;
        }
        
        #name {
            position: absolute;
            top: 28.2%;
            left: 15%;
            height: 2.68%;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) 24px/29px var(--unnamed-font-family-roboto);
            text-align: left;
            font: normal normal medium 24px/29px Roboto;
            letter-spacing: 0.48px;
            color: #000000;
            opacity: 1; 
        }

        #sem {
            position: absolute;
            top: 37.54%;
            left: 15%;
            height: 2.22%;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) var(--unnamed-font-size-20)/var(--unnamed-line-spacing-24) var(--unnamed-font-family-roboto);
            letter-spacing: var(--unnamed-character-spacing-0-4);
            text-align: left;
            font: normal normal small 20px/24px Roboto;
            letter-spacing: 0.4px;
            color: #616161;
            opacity: 1;
        }
        input{
            position:absolute;
            top:42.90%;
            left:15%;
            background: var(--unnamed-color-267dff) 0% 0% no-repeat padding-box;
            background: #267DFF 0% 0% no-repeat padding-box;
            border-radius: 5px;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) var(--unnamed-font-size-20)/var(--unnamed-line-spacing-24) var(--unnamed-font-family-roboto);
            letter-spacing: var(--unnamed-character-spacing-0-4);
            color: var(--unnamed-color-ffffff);
            text-align: left;
            font: normal normal medium 20px/24px Museo Slab 500;
            letter-spacing: 0.4px;
            color: #FFFFFF;
            opacity: 1;

        }
    </style>
</head>

<body>
    <%
        User user = (User) session.getAttribute("user");
        String memberid = (String) request.getParameter("memberid");
        String picturepath = "images/"+memberid+".jpg";
    %>
    <div id="top">
        <span id="sti">STI</span>
        <a href="index.jsp"><span id = "llogout">Logout</span></a>
    </div>
    <img src="<%= picturepath %>" id="pic"/>
    <span id="name">${studentname}</span><br />
    <span id="dept">Department: ${department}</span>
    <span id="sem">Semester: ${semester}</span>
    <%
        if(user.getType().equals("Teacher"))
        {
    %>
            <a href="${hrefvalue}"><input type="button" value="Message Parent" /></a>
    <%
        }
    %>
</body>
</html>