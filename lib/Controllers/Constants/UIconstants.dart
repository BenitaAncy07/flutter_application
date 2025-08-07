// ignore_for_file: non_constant_identifier_names

import 'package:flutter_application/Controllers/Constants/Appconstants.dart';

//=======================Appbar Headings================================
String home_appbarheading = 'FIND JOBS FOR YOU',
    myjob_appbarheading = "MY JOBS",
    profile_appbarheading = "Profile";

//======================Bottombar Headings===============================
String homelabel = 'Home',
    jobslabel = 'My jobs',
    profilelabel = 'Profile',
    dashboardlabel = "Dashboard";

//=====================Snackbar messages====================
String savedjobmsg = "Saved to My Jobs",
    unsavedjobmsg = "Job Unsaved",
    loginsuccessmsg = "Login Successful",
    logininvalidmsg = "Invalid login Credential",
    noresumemsg = "Resume not uploaded yet",
    fieldrequiredtext = "Some fields are not filled yet",
    addrequiredtext = "You haven't added ",
    yettext = " yet",
    accountcreatedmsg = "Account created successfully";

//======================Button text=========================
String siginbuttontext = "Sign in",
    createaccountbuttontext = "Create an account",
    skipbuttontext = "Skip >>",
    reportjobbuttontext = "Report job",
    findjobsbuttontext = "Find jobs",
    applynowbuttontext = "Apply now",
    updatestatusbuttontext = "Update status",
    signoutbuttontext = "Sign out",
    savebuttontext = "Save",
    deletebuttontext = "Delete",
    yesbuttontext = 'Yes',
    nobuttontext = 'No',
    undobuttontext = 'Undo',
    addbuttontext = "Add",
    uploadbuttontext = "Upload resume",
    registerbuttontext = "Sign Up",
    nextbuttontext = "Confirm";

//==================Textfield label text==============================
String
namelabeltext = pleaseentertext + nametext.toLowerCase(),
emaillabeltext = pleaseentertext + emailtext.toLowerCase(),
passwordlabeltext = pleaseentertext + passwordtext.toLowerCase(),
confirmpasswordlabeltext = pleaseentertext + confirmpasswordtext.toLowerCase(),
companylabeltext = "${pleaseentertext}company name",
companytypelabeltext = "${pleaseentertext}company type",
aboutcompanylabeltext = "Write about your company and its vision/mission",
locationlabeltext = "${pleaseentertext}location",
phonenolabeltext = pleaseentertext + phonetext.toLowerCase(),
jobtitlelabeltext = "Please mention your past job position",
workedcompanylabeltext =
    "Kindly specify the company in which you held this position",
leveleducationlabeltext = "Indicate your qualification",
fieldlabeltext = "Area of specialization",
skilllabeltext = "Please add your skill",
expyearlabeltext = "${pleaseentertext}skill experience in years",
langlabeltext = "Please enter known languages",
minimumpaylabeltext = "What is the minimum pay you'll consider in your search?",
desiredjoblabeltext = "What are your desired job title?";

//=====================Textfield hint text=============================
String searchhinttext = "Enter job, company, locality or keywords",
    namehinttext = "${exampletext}Rubancy",
    emailhinttext = "${exampletext}Rubancy@example.com",
    passwordhinttext = "${exampletext}ABC123@d",
    companyhinttext = "${exampletext}ABC Private Ltd",
    companytypehinttext = "${exampletext}IT Services",
    aboutcompanyhinttext = "",
    locationhinttext = "${exampletext}Nagercoil, Tamilnadu",
    phonehinttext = "$exampletext+91 1234567890",
    jobtitlehinttext = "${exampletext}Software Developer",
    workedcompanyhinttext = "${exampletext}XYZ Private Ltd",
    leveleducationhinttext = "${exampletext}Bachelor's degree",
    fieldeducationhinttext = "${exampletext}Computer science",
    skillhinttext = "${exampletext}Php",
    expyearhinttext = "${exampletext}2 years",
    langhintext = "${exampletext}English",
    minimumpayhinttext = "${exampletext}3000",
    desiredjobhinttext = "${exampletext}Senior software developer";

//======================Textfield validator text========================
String
passwordnomatchtext = "Confirm password did not match",
strongpasswordtext =
    'Password must be at least 8 characters and include uppercase, lowercase, number, and special character',
requiredemailtext = 'Email is required',
requiredfieldtext = 'This field is required',
validemailtext = 'Enter a valid email address';

//==================Symbols as text===========================
String bulletsymbol = "➤ ", currencysymbol = "₹";

//=================Crucial decorative text========================
String introscreentext = "The world's no. 1 job search site",
    registersubtext = "Create your account",
    exitheading = "Exit?",
    exitcontent = 'Do you really want to leave this page?',
    nointernet_heading = "No internet connection",
    nointernet_content = "It looks like you're offline. Check your connection",
    failedmsgtext = 'Something went wrong',
    loadingtext = "Loading....",
    employersnoseetext = "Not shown to employers",
    pleaseentertext = "Please enter your ",
    exampletext = "e.g. ";

//==================who======================
String employertext = "Employer", jobseekertext = "Jobseeker";

//===============================
String
profileinsighttext = 'Profile insights',
skilltext = 'Skills',
jobdetailtext = 'Job details',
jobtypetext = 'Job type',
responsibilitiestext = 'Responsibilities:',
fulljob = 'Job Description',
benefitstext = 'Benefits',
paytext = 'Pay',
shifttext = 'Shift and schedule',
requirementstext = 'What we\'re looking for:',
archivetext = "Archive",
unarchivetext = "Unarchive",
withdrawtext = "Withdraw application",
appliedheadingtext = "Update your application status",
appliedheadingtext2 = "Employers won't see this",
moreoptionheading = "Manage this application",
profilesetting = "Profile settings",
profilesettinghead1 = "Employers can find your profile",
profilesettingsubhead1 =
    "Employers can find your profile and contact you about jobs. we attempt to hide identifiable details until you respond to employers.",
profilesettinghead2 = "Employers can't find your profile",
profilesettingsubhead2 =
    "Only employers you've applied to can see your profile. Other employers can't find your profile and contact you about jobs",
replacefiletext = "Replace file",
deletefiletext = "Delete",
downloadfiletext = "Download",
resumetext = "Resume",
aboutyoutext = "Improve your job matches",
qualificationtext = "Qualifications",
qualificationsubtext = "Highlight your skills and experience",
jobpreferencetext = "Job Preferences",
jobpreferencesubtext =
    "Save specific details like minimum desired pay and schedule.",
readytoworktext = "Ready to work",
readytoworksubtext =
    "Let employers know that you\'re available to start working as soon as possible",
readytoworkcontenttext = "I'm available to start immediately",
interviewingtext = "Interviewing",
offerreceivedtext = "Offer received",
hiredtext = "Hired",
notselectedtext = "Not selected by employer",
notinterestedtext = "No longer interested",
workexpereiencetext = "Most recent work experience",
educationtext = "Education",
languagestext = "Languages",
jobtitlestext = "Desired job titles",
workscheduletext = "Work schedule",
minimumpaytext = "Minimum base pay",
worklocationtext = "Work location",
searchtext = "Search",
logintext = " Login",
datetext = "Added on ",
desiredjobtext = "What are your desired job titles?",
desiredjobtypetext = "what are your desired job types?",
worksettingtext = "Desired work setting",
minimumpayconsidertext =
    "What is the minimum pay you'll consider in your search?",
desiredscheduletext = "What are your desired schedule?",
shiftstext = "Shifts",
payperiodtext = "Pay Period";

String nametext = "Name",
    emailtext = "Email",
    passwordtext = "Password",
    confirmpasswordtext = "Confirm Password",
    phonetext = "Phone no",
    locationtext = "Location",
    companytext = "Company",
    companytypetext = "Company Based on : ",
    aboutcompanytext = "About Company : ",
    companydetailtext = "Company Detail",
    jobtitletext = "Job title",
    leveleducationtext = "Education level",
    fieldstudytext = "Field of Study",
    skilltext2 = "Skill",
    expyeartext = "Years of experience",
    languagetext = "Language",
    proficiencytext = "Proficiency";

List<String> MyJoboptions = [saved, applied, archived],
    MyJobnocontent_text = [
      "No jobs saved yet",
      "No jobs applied yet",
      "Nothing yet",
    ],
    MyJobnocontent_text1 = [
      "Jobs you save appear here",
      "Jobs you applied appear here",
      "Applications you archive appear here",
    ];
