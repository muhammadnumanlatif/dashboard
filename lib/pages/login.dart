import 'package:admin/utils/myTheme.dart';

import '../utils/utils.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;
  LoginModel? loginModel;
  @override
  void initState() {
    super.initState();
    loginModel = LoginModel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProgressHUD(
          key: UniqueKey(),
          opacity: 0.3,
          child: _loginUI(context),
          valueColor: AlwaysStoppedAnimation<Color>(
            MyTheme.darkAmberColor,
          ),
          inAsyncCall: isApiCallProcess,
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  MyTheme.lightAmberColor,
                  MyTheme.lightTealColor,
                ],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(75),
                bottomRight: Radius.circular(75),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                //*Title
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Dashboard Login',
                    style: TextStyle(
                      color: MyTheme.lightAmberColor,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.10,
                    ),
                  ),
                ),
                Spacer(),
                //*logo
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.admin_panel_settings,
                    size: MediaQuery.of(context).size.width * 0.42,
                    color: MyTheme.lightAmberColor,
                  ),
                ),
              ],
            ),
          ),
          //*host form item
          Padding(
            padding: EdgeInsets.only(
              bottom: 15,
              top: 35,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              Icon(Icons.web_rounded),
              'host',
              'Host Url',
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Can\'t be Empty';
                }
                return '';
              },
              (onSavedVal) {
                loginModel?.host = onSavedVal;
              },
              initialValue: loginModel!.host.toString(),
              borderFocusColor: Theme.of(context).accentColor.withOpacity(0.2),
              prefixIconColor: Theme.of(context).accentColor,
              borderColor: Theme.of(context).accentColor,
            ),
          ),
          //*key form item
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              Icon(Icons.lock_clock_rounded),
              'key',
              'Consumer Key',
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Can\'t be Empty';
                }
                return '';
              },
              (onSavedVal) {
                loginModel?.key = onSavedVal;
              },
              initialValue: loginModel!.key.toString(),
              borderFocusColor: Theme.of(context).accentColor.withOpacity(0.2),
              prefixIconColor: Theme.of(context).accentColor,
              borderColor: Theme.of(context).accentColor,
            ),
          ),
          //*key form item
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              Icon(Icons.lock_clock_rounded),
              'key',
              'Consumer Secret',
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Can\'t be Empty';
                }
                return '';
              },
              (onSavedVal) {
                loginModel?.secret = onSavedVal;
              },
              initialValue: loginModel!.secret.toString(),
              borderFocusColor: Theme.of(context).accentColor.withOpacity(0.2),
              prefixIconColor: Theme.of(context).accentColor,
              borderColor: Theme.of(context).accentColor,
            ),
          ),
          //*text
          Center(
            child: Text(
              'QR',
              style: TextStyle(
                color: MyTheme.darkTealColor,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          //* qr code
          Center(
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.qr_code_outlined,
                size: 100,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          //*button
          Center(
            child: FormHelper.submitButton(
              'Login',
              () {},
              btnColor: Theme.of(context).accentColor.withOpacity(0.5),
              borderColor: Theme.of(context).accentColor,
              txtColor: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
