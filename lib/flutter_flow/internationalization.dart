import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zh_Hans', 'fr', 'de'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? zh_HansText = '',
    String? frText = '',
    String? deText = '',
  }) =>
      [enText, zh_HansText, frText, deText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'am12l4iq': {
      'en': '50%',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'znkmlzz3': {
      'en': 'Home',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'oxfuptx0': {
      'en': '@uxlivinglab',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'pnj8nwnk': {
      'en': 'Home',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // home
  {
    '6be7o1ln': {
      'en': 'Create QR code for your wifi    ',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '06ia937w': {
      'en':
          '\n Users can Scan the QR code \n to connect without entering \n wifi credentials',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'l9d6icoy': {
      'en': 'Read the Disclaimer before \n continuing',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ilrh45k8': {
      'en': 'Create QR Code',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'fs8h6510': {
      'en': 'Home',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // enter_password
  {
    '2nlohjz7': {
      'en': 'Enter Wifi Credentials\n',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'e90zgap9': {
      'en': '1',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'e3rjqm1h': {
      'en': '\nSelect Wifi',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'gna32mj4': {
      'en': '2',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ug7zhmyk': {
      'en': '\nData Safty',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '2we8o0rh': {
      'en': '3',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ywmq5v5z': {
      'en': '\nEnter Credentials',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '3phbwedl': {
      'en': '4',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'i7xm61oi': {
      'en': '\nCreate QR Code',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'j4w0l7hc': {
      'en': 'Password',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'pgsf3xwy': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'u4ud3vip': {
      'en': 'Encryption',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ovd3dzyb': {
      'en': 'WPA/WPA2',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'gou4rdkk': {
      'en': 'WEP',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'p8oofkst': {
      'en': 'None',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'hxjlxwu1': {
      'en': 'I agree to the terms and conditions of\nDowell Wifi QR Code ',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '7a3ofu27': {
      'en':
          'Disclaimer_ _ Dowell may collect certain personally identifiable information(\"personal information\") about you when you visit our App. Examples of personal information we may collect include your name,address,telephone number,fax number,and e-mail address.',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'inozitla': {
      'en': ' ',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'i81214uk': {
      'en': 'Credentials\n',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '7rwldszl': {
      'en': 'Home',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // terms
  {
    'xv29bn0r': {
      'en': 'Terms & Conditions',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '0ojet0ww': {
      'en':
          'Terms & Conditions\n\nPrivacy Policy for WiFi QR Code Mobile App\nQR code generator with a logo!\nThe professional QR Code Management platform to create, track, and edit all your QR codes in one place.\n \nThis Application collects some Personal Data from its Users.\n \nThis document can be printed for reference by using the print command in the settings of any browser.\n \nOwner and Data Controller:\n We, Dowell Research Pte. Ltd. are committed to protecting your privacy. This Privacy Policy explains how your personal information is collected, used, and disclosed. This Privacy Policy applies to our website, application, and its associated subdomains (collectively, our \"Service\") alongside ours. By accessing or using our Service, you signify that you have read, understood, and agree to our collection, storage, use, and disclosure of your personal information as described in this Privacy Policy and our Terms of Service.\n \nDefinitions and key terms\n To help explain things as clearly as possible in this Privacy Policy, every time any of these terms are referenced, are strictly defined as\nPersonal Data (or Data: Any information that directly, indirectly, or in connection with other information — including a personal identification number — allows for the identification or identifiability of a natural person.\n\n\nUsage Data: Information collected automatically through this Application (or third-party services employed in this Application), which can include: the IP addresses or domain names of the computers utilized by the Users who use this Application, the URI addresses (Uniform Resource Identifier), the time of the request, the method utilized to submit the request to the server, the size of the file received in response, the numerical code indicating the status of the server\'s answer (successful outcome, error, etc.), the country of origin, the features of the browser and the operating system utilized by the User, the various time details per visit (e.g., the time spent on each page within the Application) and the details about the path followed within the Application with special reference to the sequence of pages visited, and other parameters about the device operating system and/or the User\'s IT environment.\n\n\nUser: The individual using this Application who, unless otherwise specified, coincides with the Data Subject.\n\n\nData Subject: The natural person to whom the Personal Data refers.\n\n\nData Processor (or Data Supervisor): The natural or legal person, public authority, agency, or other body which processes Personal Data on behalf of the Controller, as described in this privacy policy.\n\n\nData Controller (or Owner): The natural or legal person, public authority, agency, or other body which, alone or jointly with others, determines the purposes and means of the processing of Personal Data, including the security measures concerning the operation and use of this Application. The Data Controller, unless otherwise specified, is the Owner of this Application.\nThis Application: The means by which the Personal Data of the User is collected and processed.\n\n\nService: The service provided by this Application as described in the relative terms (if available) and on this site/application. The service provider is providing a satisfaction guarantee for 30 days and also assures the buyer that a refund will be issued if the buyer is not satisfied with a product or service within a certain timeframe and can opt-out from such services. By this process, the company wants to ensure that customers are happy with the first purchase they make. But if the buyer doesn\'t opt-out within the time frame, the service will continue and the buyer will lose the chance of withdrawing later. The Service will continue and the buyer is liable for subscription charges deducted.\n\n\nEuropean Union (or EU): Unless otherwise specified, all references made within this document to the European Union include all current member states to the European Union and the European Economic Area. \n\n\nCookie: A small amount of data generated by a website and saved by your web browser is used to identify your browser, provide analytics, and remember information about you such as your language preference or login information.\n\n\nCompany: when this policy mentions Company, we, Dowell Research Pte. Ltd. it refers to that it is responsible for your information under this Privacy Policy that is responsible for your\n\n\nCountry: where the owners/directors of Dowell Research Pte. Ltd. are based, in this case, Singapore. \n \n Customer: refers to the company, organization, or person that signs up to use the relationships with our services or service users.  \n\n\nDevice: any internet-connected device such as a phone, tablet, computer, or any other device that can be used to visit and use the services.\n\n\nIP address: Every device connected to the Internet is assigned a number known as an Internet protocol (IP) address. These numbers are usually assigned in geographic blocks An IP address can often be used to identify the location from which a device is connecting to the Internet.\n\n\nPersonnel: refers to those individuals who are appointed to our Website.\n\n\nYou: a person or entity that is registered with our site, which can be accessed via this URL to use the Services. \nTracker: Tracker indicates any technology - e.g Cookies, unique identifiers, web beacons, embedded scripts, e-tags, and fingerprinting - that enables the tracking of Users, for example by accessing or storing information on the User’s device.\n \nTypes of Data collected:\n      \tAmong the types of Personal Data that this Application collects, by itself or through third parties, there are: Contacts permission; Camera permission; Microphone permission; Social media accounts permission; Approximate location permission (continuous); Cookies; Usage Data; email address; password; unique device identifiers for advertising (Google Advertiser ID or IDFA, for example).\nComplete details on each type of Personal Data collected are provided in the dedicated sections of this privacy policy or by specific explanation texts displayed prior to the Data collection. Personal Data may be freely provided by the User, or, in case of Usage Data, collected automatically when using this Application.\n      \tUnless specified otherwise, all Data requested by this Application is mandatory and failure to provide this Data may make it impossible for this Application to provide its services. In cases where this Application specifically states that some Data is not mandatory, Users are free not to communicate this Data without consequences to the availability or the functioning of the Service.\nUsers who are uncertain about which Personal Data is mandatory are welcome to contact the Owner.\n      \tAny use of Cookies – or of other tracking tools – by this Application or by the owners of third-party services used by this Application serves the purpose of providing the Service required by the User, in addition to any other purposes described in the present document and in the Cookie Policy, if available.\nUsers are responsible for any third-party Personal Data obtained, published, or shared through this Application and confirm that they have the third party\'s consent to provide the Data to the Owner.\n \nMode and place of processing the Data:\nMethods of processing\n The Owner takes appropriate security measures to prevent unauthorized access, disclosure, modification, or unauthorized destruction of the Data.\nThe Data processing is carried out using computers and/or IT-enabled tools, following organizational procedures and modes strictly related to the purposes indicated. In addition to the Owner, in some cases, the Data may be accessible to certain types of persons in charge, involved with the operation of this Application (administration, sales, marketing, legal, system administration) or external parties (such as third-party technical service providers, mail carriers, hosting providers, IT companies, communications agencies) appointed, if necessary, as Data Processors by the Owner. An updated list of these parties may be requested from the Owner at any time.\n Legal basis of processing\n The Owner may process Personal Data relating to Users if one of the following applies:\n·Users have given their consent for one or more specific purposes. Note: Under some legislations, the Owner may be allowed to process Personal Data until the User objects to such processing (“opt-out”), without having to rely on consent or any other of the following legal bases. This, however, does not apply, whenever the processing of Personal Data is subject to European data protection law;\n·Provision of Data is necessary for the performance of an agreement with the User and/or for any pre-contractual obligations thereof;\n·Processing is necessary for compliance with a legal obligation to which the Owner is subject;\n·Processing is related to a task that is carried out in the public interest or in the exercise of official authority vested in the Owner;\n·Processing is necessary for the purposes of the legitimate interests pursued by the Owner or by a third party.\n \n In any case, the Owner will gladly help to clarify the specific legal basis that applies to the processing, and in particular whether the provision of Personal Data is a statutory or contractual requirement, or a requirement necessary to enter into a contract.\n \n \n \nPlace\nThe Data is processed at the Owner\'s operating offices and in any other places where the parties involved in the processing are located.\n      \tDepending on the User\'s location, data transfers may involve transferring the User\'s Data to a country other than their own. To find out more about the place of processing of such transferred Data, Users can check the section containing details about the processing of Personal Data.\nUsers are also entitled to learn about the legal basis of Data transfers to a country outside the European Union or to any international organization governed by public international law or set up by two or more countries, such as the UN, and about the security measures taken by the Owner to safeguard their Data.\n      \tIf any such transfer takes place, Users can find out more by checking the relevant sections of this document or inquire with the Owner using the information provided in the contact section.\nRetention time\nPersonal Data shall be processed and stored for as long as required by the purpose they have been collected for.\nTherefore Personal Data collected for purposes related to the performance of a contract between the Owner and the User shall be retained until such contract has been fully performed.\n·         Personal Data collected for the purposes of the Owner’s legitimate interests shall be retained as long as needed to fulfill such purposes. Users may find specific information regarding the legitimate interests pursued by the Owner within the relevant sections of this document or by contacting the Owner.\n·         \nThe Owner may be allowed to retain Personal Data for a longer period whenever the User has given consent to such processing, as long as such consent is not withdrawn. Furthermore, the Owner may be obliged to retain Personal Data for a longer period whenever required to do so for the performance of a legal obligation or upon order of an authority.\n·   \n      Once the retention period expires, Personal Data shall be deleted. Therefore, the right of access, the right to erasure, the right to rectification, and the right to data portability cannot be enforced after the expiration of the retention period.\n \nThe purposes of processing\nThe Data concerning the User is collected to allow the Owner to provide its Service, comply with its legal obligations, respond to enforcement requests, protect its rights and interests (or those of its Users or third parties), detect any malicious or fraudulent activity, as well as the following: Device permissions for Personal Data access, Analytics, Registration and authentication, Access to third-party accounts, Registration and authentication provided directly by this Application and Advertising.\nFor specific information about the Personal Data used for each purpose, the User may refer to the section “Detailed information on the processing of Personal Data”.\n \n Device permissions for Personal Data access\nDepending on the User\'s specific device, this Application may request certain permissions that allow it to access the User\'s device Data as described below.\nBy default, these permissions must be granted by the User before the respective information can be accessed. Once the permission has been given, it can be revoked by the User at any time. In order to revoke these permissions, Users may refer to the device settings or contact the Owner for support at the contact details provided in the present document.\nThe exact procedure for controlling app permissions may be dependent on the User\'s device and software.\n      \tPlease note that the revoking of such permissions might impact the proper functioning of this Application.\n      \tIf the User grants any of the permissions listed below, the respective Personal Data may be processed (i.e accessed to, modified, or removed) by this Application.\n \nApproximate location permission (continuous)\n      \tUsed for accessing the User\'s approximate device location. This Application may collect, use, and share User location Data in order to provide location-based services.\n Camera permission\nUsed for accessing the camera or capturing images and video from the device.\n Contacts permission\nUsed for accessing contacts and profiles on the User\'s device, including the changing of entries.\n Microphone permission\nAllows accessing and recording microphone audio from the User\'s device.\n \nDetailed information on the processing of Personal Data\nPersonal Data is collected for the following purposes and using the following services:\n Access to third-party accounts\nThis type of service allows this Application to access Data from your account on a third-party service and perform actions with it. These services are not activated automatically, but require explicit authorization by the User.\nAdvertising\nThis type of service allows User Data to be utilized for advertising communication purposes. These communications are displayed in the form of banners and other advertisements on this Application, possibly based on User interests.\n \nThis does not mean that all Personal Data are used for this purpose. Information and conditions of use are shown below.\nSome of the services listed below may use Cookies or other Identifiers to identify Users or they may use the behavioral retargeting technique, i.e. displaying ads tailored to the User’s interests and behavior, including those detected outside this Application. For more information, please check the privacy policies of the relevant services.\n \nIn addition to any opt-out feature offered by any of the services below, Users may opt out by visiting the Network Advertising Initiative opt-out page.\n \nUsers may also opt-out of certain advertising features through applicable device settings, such as the device advertising settings for mobile phones or ads settings in general.\n \n \n \n Registration and authentication\nBy registering or authenticating, Users allow this Application to identify them and give them access to dedicated services. Depending on what is described below, third parties may provide registration and authentication services. In this case, this Application will be able to access some Data, stored by these third-party services, for registration or identification purposes.\nSome of the services listed below may also collect Personal Data for targeting and profiling purposes; to find out more, please refer to the description of each service.\n Google OAuth\nGoogle OAuth is a registration and authentication service provided by Google LLC or by Google Ireland Limited, depending on the location this Application is accessed from and is connected to the Google network.\nPersonal Data processed: various types of Data as specified in the privacy policy of the service.\nPlace of processing: United States – Privacy Policy; Ireland – Privacy Policy.\n·      Device permissions for Personal Data access\nThis Application requests certain permissions from Users that allow it to access the User\'s device Data as described below.\nDevice permissions for Personal Data access (this Application)\nThis Application requests certain permissions from Users that allow it to access the User\'s device Data as summarized here and described within this document.\nPersonal Data processed: Approximate location permission (continuous); Camera permission; Contacts permission; Microphone permission; Social media accounts permission.\n·      Registration and authentication provided directly by this Application\nBy registering or authenticating, Users allow this Application to identify them and give them access to dedicated services. The Personal Data is collected and stored for registration or identification purposes only. The Data collected are only those necessary for the provision of the service requested by the Users.\nDirect registration (this Application)\nThe User registers by filling out the registration form and providing the Personal Data directly to this Application.\nPersonal Data processed: email address; password.\nThe rights of Users\nUsers may exercise certain rights regarding their Data processed by the Owner.\nIn particular, Users have the right to do the following:\n·         Withdraw their consent at any time. Users have the right to withdraw consent where they have previously given their consent to the processing of their Personal Data.\n·         Object to processing of their Data. Users have the right to object to the processing of their Data if the processing is carried out on a legal basis other than consent. Further details are provided in the dedicated section below.\n·         Access their Data. Users have the right to learn if Data is being processed by the Owner, obtain disclosure regarding certain aspects of the processing and obtain a copy of the Data undergoing processing.\n·         Verify and seek rectification. Users have the right to verify the accuracy of their Data and ask for it to be updated or corrected.\n·         Restrict the processing of their Data. Users have the right, under certain circumstances, to restrict the processing of their Data. In this case, the Owner will not process their Data for any purpose other than storing it.\n·         Have their Personal Data deleted or otherwise removed. Users have the right, under certain circumstances, to obtain the erasure of their Data from the Owner.\n·         Receive their Data and have it transferred to another controller. Users have the right to receive their Data in a structured, commonly used and machine-readable format and, if technically feasible, to have it transmitted to another controller without any hindrance. This provision is applicable provided that the Data is processed by automated means and that the processing is based on the User\'s consent, on a contract which the User is part of or on pre-contractual obligations thereof.\n·         Lodge a complaint. Users have the right to bring a claim before their competent data protection authority.\nDetails about the right to object to processing\nWhere Personal Data is processed for a public interest, in the exercise of an official authority vested in the Owner or for the purposes of the legitimate interests pursued by the Owner, Users may object to such processing by providing a ground related to their particular situation to justify the objection.\nUsers must know that, however, should their Personal Data be processed for direct marketing purposes, they can object to that processing at any time without providing any justification. To learn whether the Owner is processing Personal Data for direct marketing purposes, Users may refer to the relevant sections of this document.\nHow to exercise these rights\nAny requests to exercise User rights can be directed to the Owner through the contact details provided in this document. These requests can be exercised free of charge and will be addressed by the Owner as early as possible and always within one month.\nAdditional information about Data collection and processing\nLegal action\nThe User\'s Personal Data may be used for legal purposes by the Owner in Court or in the stages leading to possible legal action arising from improper use of this Application or the related Services.\nThe User declares to be aware that the Owner may be required to reveal personal data upon request of public authorities.\nAdditional information about User\'s Personal Data\nIn addition to the information contained in this privacy policy, this Application may provide the User with additional and contextual information concerning particular Services or the collection and processing of Personal Data upon request.\nSystem logs and maintenance\nFor operation and maintenance purposes, this Application and any third-party services may collect files that record interaction with this Application (System logs) use other Personal Data (such as the IP Address) for this purpose.\nInformation not contained in this policy\nMore details concerning the collection or processing of Personal Data may be requested from the Owner at any time. Please see the contact information at the beginning of this document.\nHow “Do Not Track” requests are handled\nThis Application does not support “Do Not Track” requests.\nTo determine whether any of the third-party services it uses honor the “Do Not Track” requests, please read their privacy policies.\nChanges to this privacy policy\nThe Owner reserves the right to make changes to this privacy policy at any time by notifying its Users on this page and possibly within this Application and/or - as far as technically and legally feasible - sending a notice to Users via any contact information available to the Owner. It is strongly recommended to check this page often, referring to the date of the last modification listed at the bottom.\nShould the changes affect processing activities performed on the basis of the User’s consent, the Owner shall collect new consent from the User, where required.\nLegal information\nThis privacy statement has been prepared based on provisions of multiple legislations, including Art. 13/14 of Regulation (EU) 2016/679 (General Data Protection Regulation).\nThis privacy policy relates solely to this Application, if not stated otherwise within this document.\n \nGoverning Law\n\n\nThe laws of the SINGAPORE excluding its conflicts of law rules shall govern this Agreement and your use of our service. Your use of our service may also be subject to other local, state, national, or international laws. \n \nYour Consent\n \nBy using our service, registering an account, or making a purchase, you consent to this Privacy Policy. \n \n Contact Us:\nDowell Research Pte. Ltd\nLevel 42, 6 Battery road\nSingapore\nSingapore 049909\n\n\n\n\n\n',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '3xbxv3gr': {
      'en': 'Home',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // Send_QR
  {
    'u79n7kje': {
      'en': 'Email QR Code',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'hhghr0cd': {
      'en': 'Recipient Name',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '1zj568er': {
      'en': 'Enter the Name of recipient',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'kfzvpult': {
      'en': 'Recipient Email',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'e0h39uk7': {
      'en': 'Enter the Email of recipient',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'p98czt8d': {
      'en': 'Subject',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    's6etwrts': {
      'en': 'Enter the subject of the email',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'wj2gmwtv': {
      'en': '\n',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'sbdn2fy2': {
      'en': 'Email Content',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'xavx6txb': {
      'en': 'Enter your message',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'puyz7l3k': {
      'en': 'Email the QR Code',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '7g6tycu8': {
      'en': 'Home',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // QR_code
  {
    '59ejfvno': {
      'en': 'Wifi QR Code Created\n',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '4g877zl6': {
      'en': '1',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'wlokf62f': {
      'en': '\nSelect Wifi',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ok6nukvc': {
      'en': '2',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '7ej6f40u': {
      'en': '\nData Safty',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '17rh46gw': {
      'en': '3',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'rvd7572w': {
      'en': '\nEnter Credentials',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '3n4sa8k0': {
      'en': '4',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '49x30532': {
      'en': '\nCreate QR Code',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '8soo5yry': {
      'en': 'Display the QR Code for scanning',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'w78qvgjk': {
      'en': 'Email the QR Code',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'vhjjulto': {
      'en': 'Download QR Code Image',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '2w5epjq4': {
      'en': 'Finish Up',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'r0zqou94': {
      'en': 'Rate this App',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'au25195j': {
      'en': 'Home',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // chose_wifi
  {
    '57ctjbu6': {
      'en': 'Select Wifi to create QR code\n',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'atf9hanc': {
      'en': '1',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '0li0levi': {
      'en': '\nSelect Wifi',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'jegz4303': {
      'en': '2',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    't0lt96f3': {
      'en': '\nData Safty',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'kav1gnwt': {
      'en': '3',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '3cce4lu6': {
      'en': '\nEnter Credentials',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'dptdmf0y': {
      'en': '4',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'g0jr55sb': {
      'en': '\nCreate QR Code',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'fghywis8': {
      'en': ' ',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'pepy1r21': {
      'en': 'Credentials\n',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'zrsfkvaa': {
      'en': 'Home',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // listWidget
  {
    'rjdpzuu8': {
      'en': 'Home',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // customization
  {
    'rfwr2bop': {
      'en': 'Your Logo',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'cu5zu14k': {
      'en': 'Update Logo',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'qymvb0te': {
      'en': 'Skip',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'oltjv9mc': {
      'en': 'Customization',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '8tnqtnap': {
      'en': 'Home',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // data_safty
  {
    '0m5jzv9g': {
      'en': '1',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ipd9q9qx': {
      'en': '\nSelect Wifi',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '1e8zdstn': {
      'en': '2',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'm6i43tm1': {
      'en': '\nData Safty',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '4xwfihe0': {
      'en': '3',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '9xwwi67v': {
      'en': '\nEnter Credentials',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ecptuevb': {
      'en': '4',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ag5sl0t4': {
      'en': '\nCreate QR Code',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '19xolb7x': {
      'en': 'Data Safety',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '7g703w0n': {
      'en':
          'Dowell may collect certain personllay identifiavle information(\"personal information\") about \nyou when you visit our App. Examples of personal information',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'a5fyn8t9': {
      'en': 'more',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'aup0rl6r': {
      'en': 'Personal Privacy',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'w56p4mou': {
      'en':
          'Dowell may collect certain personllay identifiavle information(\"personal information\") about \nyou when you visit our App. Examples of personal information we may collect include your name , address, telephone number, fax number, and email address. we also automaticlly collect certain non-personally idintifayion infromation when you visit our App,including , butnot limited to,the location ,the type of browser you are using ,the type of operating system',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '3yzcu8md': {
      'en': 'App details',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '7c0l6xqk': {
      'en': 'installation ID \n1234567890\ninstalled version\n8.00',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'd77rdik4': {
      'en': ' ',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'jww22bhy': {
      'en': 'Credentials\n',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '44niv50g': {
      'en': 'Data Safety',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '3qhxwvyb': {
      'en': 'Home',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // showImg
  {
    'mlcw0nf6': {
      'en': 'Home',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // customizationCopy
  {
    '4vpybeaw': {
      'en': 'Your Logo',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '0jcyjwfj': {
      'en': 'Skip',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'h0knvrb1': {
      'en': ' ',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '4b4nl317': {
      'en': 'Credentials\n',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '4vlegaz9': {
      'en': 'Customization',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '7b4xixmv': {
      'en': 'Home',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // LoginComponent
  {
    'qsspy3hw': {
      'en': 'Home',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // reports
  {
    'glk9yelq': {
      'en': 'Reports\n',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'xmfkyuzz': {
      'en': 'Home',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // QRCodeDedatils
  {
    'w9u8q49d': {
      'en': 'Wifi QR Code Details\n',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'fjcqyl93': {
      'en': '1',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '1z13jnc6': {
      'en': '\nSelect Wifi',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '0357obvm': {
      'en': '2',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '6rx15cxw': {
      'en': '\nData Safty',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '6wvc2xkw': {
      'en': '3',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '9ivi9pg0': {
      'en': '\nEnter Credentials',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'lklvrpsk': {
      'en': '4',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'pk6qlke4': {
      'en': '\nCreate QR Code',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'u616wj3k': {
      'en': 'Display the QR Code for scanning',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'tmoyp2jx': {
      'en': 'Email the QR Code',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'kqpappnj': {
      'en': 'Download QR Code Image',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'pazf0fs8': {
      'en': 'Rate this App',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'gfvkuknm': {
      'en': 'Home',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // Signup
  {
    'fr70acsx': {
      'en': 'Home',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // GlobalTopMenuBar
  {
    'pjsumdk5': {
      'en': '6',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'tm3dct84': {
      'en': 'Learning Mode',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // WifiTile
  {
    '5qemfc90': {
      'en': 'Wifi',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // SheetSimple
  {
    'lanhkmk0': {
      'en': 'Login',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'cztedxoi': {
      'en': 'Reports',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'lhq2zoxw': {
      'en': 'Settings',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'fgw31t57': {
      'en': 'Cancel',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // reportTile
  {
    'mwcl2100': {
      'en': 'Wifi Name ',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '6w6cnyq2': {
      'en': 'Id ',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'widzimne': {
      'en': 'password',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // Miscellaneous
  {
    'jkaud86k': {
      'en':
          'In order to search nearby, this app requires access to your current location.',
      'de':
          'Um in der Nähe suchen zu können, benötigt diese App Zugriff auf Ihren aktuellen Standort.',
      'fr':
          'Afin de rechercher à proximité, cette application nécessite l\'accès à votre position actuelle.',
      'zh_Hans': '为了搜索附近，此应用程序需要访问您当前的位置。',
    },
    'm0x9oqn8': {
      'en': 'Wifi QR Code needs your location for analytics purposes',
      'de': 'Der WLAN-QR-Code benötigt Ihren Standort für Analysezwecke',
      'fr':
          'Le code QR Wifi a besoin de votre emplacement à des fins d\'analyse',
      'zh_Hans': 'Wifi QR 码需要您的位置以进行分析',
    },
    '4a7grp1a': {
      'en':
          'Wifi QR Code needs access to photo library to customize the experience for you',
      'de':
          'Der WLAN-QR-Code benötigt Zugriff auf die Fotobibliothek, um das Erlebnis individuell auf Sie abzustimmen',
      'fr':
          'Le code QR Wifi a besoin d\'un accès à la photothèque pour personnaliser l\'expérience pour vous',
      'zh_Hans': 'Wifi QR 码需要访问照片库才能为您定制体验',
    },
    '9916rybl': {
      'en':
          'Wifi QR Code needs access to your network state to get wifi information',
      'de':
          'Der WLAN-QR-Code benötigt Zugriff auf Ihren Netzwerkstatus, um WLAN-Informationen zu erhalten',
      'fr':
          'Le code QR Wifi a besoin d\'accéder à l\'état de votre réseau pour obtenir des informations sur le wifi',
      'zh_Hans': 'Wifi二维码需要访问您的网络状态才能获取wifi信息',
    },
    'tsfkssdt': {
      'en':
          'Wifi QR Code needs access to your wifi state to get wifi information',
      'de':
          'Der WLAN-QR-Code benötigt Zugriff auf Ihren WLAN-Status, um WLAN-Informationen zu erhalten',
      'fr':
          'Le code QR Wi-Fi a besoin d\'accéder à votre état Wi-Fi pour obtenir des informations sur le Wi-Fi',
      'zh_Hans': 'Wifi二维码需要访问您的wifi状态才能获取wifi信息',
    },
    'jty01ctz': {
      'en':
          'Wifi QR Code needs to change your wifi state to verify wifi connection',
      'de':
          'Der WLAN-QR-Code muss Ihren WLAN-Status ändern, um die WLAN-Verbindung zu überprüfen',
      'fr':
          'Le code QR Wifi doit changer votre état wifi pour vérifier la connexion wifi',
      'zh_Hans': 'Wifi 二维码需要更改您的 wifi 状态才能验证 wifi 连接',
    },
    'u4aq35ec': {
      'en': 'Wifi QR Code needs internet to connect to your wifi',
      'de':
          'Der WLAN-QR-Code benötigt Internet, um eine Verbindung zu Ihrem WLAN herzustellen',
      'fr':
          'Le code QR Wifi a besoin d\'Internet pour se connecter à votre wifi',
      'zh_Hans': 'Wifi 二维码需要互联网才能连接到您的 wifi',
    },
    'jvctq1b9': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'u0a103hp': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'duwkwrri': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '7aid4msi': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'tg1l6h2n': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '4bkftp9w': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'kj6zgdzx': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'wqrljdag': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '9l189yye': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    't9igng12': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '11sogbb4': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'zegug31o': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'h5llqb2d': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'o7vvkyrn': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'jh64j5b6': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'rdzu7hkc': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'iynrs884': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '0sn4jgcq': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'jfaxkspi': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    '9dr80qga': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'wkmdp7na': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    'kwrzxnpx': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
    't8w54mv4': {
      'en': '',
      'de': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
