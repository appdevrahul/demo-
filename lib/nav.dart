import 'package:flutter/material.dart';

import 'api.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  @override
  void initState() {
    super.initState();
    _getLoginData();
  }


  _getLoginData() async {
    final res = await HttpService().postWithBody(
        '/rest_api/users_login', {"users_email": "username", });
    if (res["status"] == 200) {
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black87,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Rohit Sharma'),
            accountEmail: const Text('rohitsharma45@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/download (3).png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assets/images/images.png'),
            //     fit: BoxFit.cover,
            //   )
            // ),
          ),
          ExpansionTile(
            title: const Row(
              children: [
                Icon(
                  Icons.request_page,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Request',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            children: <Widget>[
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.double_arrow_outlined,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'General Request',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'general_request');
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.double_arrow_outlined,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Order Request',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'order_request');
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.double_arrow_outlined,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Estimate Request',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'estimate_request');
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.double_arrow_outlined,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Balance Transfer',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'balance_transfer_list');
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.double_arrow_outlined,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'IVR & Toll-free OrderList',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.double_arrow_outlined,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Offer Request',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.double_arrow_outlined,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Payment Request',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'payment');
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.double_arrow_outlined,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Refund Request',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.double_arrow_outlined,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Leave Request',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'leave_management');
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.double_arrow_outlined,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Data Dictionary',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.double_arrow_outlined,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Loan Request',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.double_arrow_outlined,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Conveyance',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'manage_conveyance');
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.double_arrow_outlined,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Attendance List',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.double_arrow_outlined,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Follow Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.double_arrow_outlined,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Ticket',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.double_arrow_outlined,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Share Form',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          ExpansionTile(
              title: const Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Customer',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              children: <Widget>[
                ListTile(
                  title: const Row(
                    children: [
                      Icon(
                        Icons.double_arrow_outlined,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Registration ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, 'register_form');
                  },
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(
                        Icons.double_arrow_outlined,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Configuration',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(
                        Icons.double_arrow_outlined,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Reminder Setting',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ]),
          const ExpansionTile(
            title: Row(
              children: [
                Icon(
                  Icons.question_mark_rounded,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Enquiry ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const ExpansionTile(
            title: Row(
              children: [
                Icon(
                  Icons.call,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'TFS & IVR ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const ExpansionTile(
            title: Row(
              children: [
                Icon(
                  Icons.message,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'SMS ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const ExpansionTile(
            title: Row(
              children: [
                Icon(
                  Icons.mic,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Voice ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const ExpansionTile(
            title: Row(
              children: [
                Icon(
                  Icons.card_travel_rounded,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Data Bank',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const ExpansionTile(
            title: Row(
              children: [
                Icon(
                  Icons.card_travel_rounded,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Employee Essential ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const ExpansionTile(
            title: Row(
              children: [
                Icon(
                  Icons.computer,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Device Management',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const ExpansionTile(
            title: Row(
              children: [
                Icon(
                  Icons.account_balance,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Account Zone',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const ExpansionTile(
            title: Row(
              children: [
                Icon(
                  Icons.card_travel_rounded,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Expense',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          ExpansionTile(
              title: const Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: Colors.green,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Academic Calender',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              children: <Widget>[
                ListTile(
                  title: const Row(
                    children: [
                      Icon(
                        Icons.double_arrow_outlined,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Calender ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, 'academic_calender');
                  },
                ),
              ]),
          const ExpansionTile(
            title: Row(
              children: [
                Icon(
                  Icons.commit_rounded,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Commitment',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const ExpansionTile(
            title: Row(
              children: [
                Icon(
                  Icons.message_outlined,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Whatsapp',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const ExpansionTile(
            title: Row(
              children: [
                Icon(
                  Icons.reviews_outlined,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Product Review',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            title: const Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Settings',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'LogOut',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
