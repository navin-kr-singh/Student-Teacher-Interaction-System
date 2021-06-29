<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
    <title>SEARCH RESULTS</title>
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
        #resultsmessage {
            position: absolute;
            top: 22.20%;
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
        .memberform{
            position: absolute;
            left: 8.44%;
            width: 82.16%;
            height: 7.31%;
            background: #FAFAFA 0% 0% no-repeat padding-box;
            opacity: 1;
            margin-bottom: 15px;
        }
        .pic{
            position:relative;
            left: 0%;
            top: 5%;
            width: 40px;
            height: 40px;
            border-radius: 20px;
            background: transparent url('homepage.jpg') 0% 0% no-repeat padding-box;
            opacity: 1;
        }
        .membersubmit{
            height: 100%;
            border-color: white;
            position: absolute;
            top:0%;
            left:4%;
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
        #emoji{
            position: absolute;
            top: 40.6%;
            left: 44.47%;
            width: 135px;
            height: 135px;
            background: #000000 0% 0% no-repeat padding-box;
            opacity:1;
        }
        #nomembermessage{
            position: absolute;
            top: 60.1%;
            left: 32.3%;
            width: 33.03%;
            height: 6.4%;;
            text-align: center;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) 24px/40px var(--unnamed-font-family-roboto);
            letter-spacing: var(--unnamed-character-spacing-0);
            text-align: center;
            font: normal normal normal 24px/40px Roboto;
            letter-spacing: 0px;
            color: #616161;
            opacity: 0.7;
        }
    </style>
</head>
<body>
    <div id="top">
        <span id="sti">STI</span>
        <a href="index.jsp"><span id = "llogout">Logout</span></a>
    </div>
    <span id="resultsmessage">Showing Results for '${memberinfo}'</span>
    <%
        Vector<String>membernames = (Vector<String>)request.getAttribute("membernames");
        Vector<String>memberids = (Vector<String>)request.getAttribute("memberids");
        int n = membernames.size();
        System.out.println("searchmemberjsp: "+n);
        boolean flag = true;
        for(int i=0; i<n; i++)
        {
            String member = membernames.get(i);
            while(member.length()<121)
            member = member + " ";
            member = member + "id:" + memberids.get(i);
            for(int j=0; j<121; j++)
            member = member + " ";
            member = member+"Student";
            flag = false;
            String picturepath = "images/"+memberids.get(i)+".jpg";
            String pos = String.valueOf(33+12*i);
    %>
            <form action = "memberinfo" method = "post" class = "memberform" style="top:<%= pos %>%;">
                <img src = "homepage.jpg" class = "pic" />
                <input type = "hidden" value = "<%= memberids.get(i) %>" name = "memberid" />
                <input type = "submit" class = "membersubmit" value = "<%= member %>"  />
            </form>
    <%
        }
        if(flag)
        {
            System.out.println("searchmemberjsp: if entered");
    %>
            <img src = "nomemberemoji.jpg" id = "emoji" />
            <span id = "nomembermessage">No results found with the search you made. Try searching using correct name or unique id</span>
    <%
        }
    %>
</body>
</html>