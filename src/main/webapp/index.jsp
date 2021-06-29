<!DOCTYPE html>
<html lang="en">
<head>
    <title>LOGIN PAGE</title>
    <style>
        h2{
            display: inline-block;
        }
        #leftdiv{
            position:absolute;
            top: 0%;
            left: 0%;
            width: 52.34%;
            height: 100%;
            background: var(--unnamed-color-267dff) 0% 0% no-repeat padding-box;
            background: #267DFF 0% 0% no-repeat padding-box;
            opacity: 1;
        }
        #STI{
            position:absolute;
            top: 26.20%;
            left: 10.05%;
            width: 324px;
            height: 50px;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) var(--unnamed-font-size-42)/var(--unnamed-line-spacing-50) var(--unnamed-font-family-museo-slab-500);
            letter-spacing: var(--unnamed-character-spacing-0);
            color: var(--unnamed-color-ffffff);
            text-align: left;
            font: normal normal normal 42px/100px Museo Slab 500;
            letter-spacing: 0%;
            color: #FFFFFF;
            opacity: 1;
        }
        #description{
            position:absolute;
            top: 39.25%;
            left: 10.05%;
            width: 57.4%;
            height: 2.5%;
            text-align: justify;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) var(--unnamed-font-size-22)/var(--unnamed-line-spacing-32) var(--unnamed-font-family-roboto);
            letter-spacing: var(--unnamed-character-spacing-0-44);
            text-align: left;
            font: normal normal normal 18px/32px Roboto;
            letter-spacing: 0.44px;
            color: #F0F0F0;
            opacity: 1;
        }
        #rightdiv{
            position:absolute;
            top: 0%;
            left: 52.34%;
            width: 47.66%;
            height: 100%;
            background: var(--unnamed-color-ffffff) 0% 0% no-repeat padding-box;
            background: #FFFFFF 0% 0% no-repeat padding-box;
            opacity: 1;
            text-align: center;
        }
        #login{
            display: inline-block;
            position:absolute;
            top: 19.63%;
            left: 40.65%;
            width: 13.22;
            height: 4.63%;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) var(--unnamed-font-size-42)/var(--unnamed-line-spacing-50) var(--unnamed-font-family-museo-slab-500);
            letter-spacing: var(--unnamed-character-spacing-0);
            color: var(--unnamed-color-267dff);
            text-align: left;
            font: normal normal normal 42px/50px Museo Slab 500;
            letter-spacing: 0px;
            color: #267DFF;
            opacity: 1;
        }
        #student-label{
            position:absolute;
            top: 29.07%;
            left: 31.36%;
            height: 2.96%;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-medium) var(--unnamed-font-size-26)/var(--unnamed-line-spacing-32) var(--unnamed-font-family-roboto);
            text-align: left;
            font: normal normal medium 1.35%/2.96% Roboto;
            letter-spacing: 0.52px;
            color: #616161;
            text-transform: capitalize;
            opacity: 1;
        }
        #student_radio{
            position:absolute;
            top: 29%;
            left: 27.21%;
            width: 15px;
            height: 15px;
            border: 2px solid #616161;
            opacity: 1;
        }
        
        #teacher_radio{
            position:absolute;
            top: 29%;
            left: 51.80%;
            width: 15px;
            height: 15px;
            border: 2px solid #616161;
            opacity: 1;           
        }
        #teacher-label{
            position:absolute;
            top: 29.07%;
            left: 55.95%;
            height: 2.96%;
            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-medium) var(--unnamed-font-size-26)/var(--unnamed-line-spacing-32) var(--unnamed-font-family-roboto);
            text-align: left;
            font: normal normal medium 1.35%/2.96% Roboto;
            letter-spacing: 0.52px;
            color: #616161;
            opacity: 1;
        }
        #loginbutton{
            position:absolute;
            top: 60.92%;
            left: 36.39%;
            height: 5.28%;
            width: 21.85%;
            background: var(--unnamed-color-267dff) 0% 0% no-repeat padding-box;
            background: #267DFF 0% 0% no-repeat padding-box;
            border-radius: 10px;
            opacity: 1;

            font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-medium) var(--unnamed-font-size-22)/var(--unnamed-line-spacing-27) var(--unnamed-font-family-roboto);
            letter-spacing: var(--unnamed-character-spacing-0-44);
            color: var(--unnamed-color-ffffff);
            text-align: left;
            font: normal normal medium 1.15%/2.5% Roboto;
            letter-spacing: 0.44px;
            color: #FFFFFF;
            opacity: 1;
        }
        form{
            display:inline-block;
        }
        #hline{
            position:absolute;
            top: 30.44%;
            left: 10.10%;
            width: 12.03%;
            height: 0px;
            border: 1px solid var(--unnamed-color-ffffff);
            border: 1px solid #FFFFFF;
            opacity: 1;
        }
        #id-input{
            position: absolute;
                top: 40%;
                left: 27.21%;           
            height: 4%;
            width: 38%;
            border: 1px solid;
            border-color:white white black white;
        }
        #password-input{
            position: absolute;
                top: 50%; 
                left: 27.21%;
            height: 4%; 
            width: 38%;
            border: 1px solid;
            border-color:white white black white;
        }
    </style>
    <script>
        history.pushState(null, null, null);
        window.addEventListener('popstate', function(){
            history.pushState(null, null, null);
        });
    </script>

</head>
<body>
    <div id = "leftdiv">
        <h2><span id = "STI">Welcome to STI</span></h2>
        <hr id = "hline"/>
        <p><span id = "description">This Is a Student-teacher Interaction site.Through this site teachers will be able to upload study related documents, assignments and interact with the parents.Students will be able to view uploaded study materials and upload assignments.</span></p>
    </div>
    <div id = "rightdiv" >
        <h2><span id = "login">Login</span></h2>
        <form action = "login" method = "post">
            <input type = "radio" id = "student_radio" name = "type" value = "Student"/><label id = "student-label">Student</label>
            <input type = "radio" id = "teacher_radio" name="type" value = "Teacher" /><label id = "teacher-label">Teacher</label>
            <input type = "text" placeholder = "Enter Unique Id" id = "id-input" name = "id"/>
            <input type = "password" placeholder = "Enter Password" id = "password-input" name = "password"/>
            <input type = "submit" value = "        LOGIN        " id = "loginbutton" />
        </form>
    </div>
</body>
</html>