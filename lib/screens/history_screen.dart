import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hubtel_coding_challenge/components/search_field.dart';
import 'package:hubtel_coding_challenge/components/send_new_button.dart';
import 'package:hubtel_coding_challenge/components/transaction_card.dart';
import 'package:hubtel_coding_challenge/model/transaction_model.dart';
import 'package:hubtel_coding_challenge/utils/app_drawables.dart';
import 'package:hubtel_coding_challenge/utils/app_palette.dart';

enum SegmentedTabs {
  history("History"),
  summary("Transaction Summary");

  final String value;
  const SegmentedTabs(this.value);
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // segmented tabs for history and trasanction summary
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: TabBar(
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                  unselectedLabelStyle: const TextStyle(
                      // fontWeight: FontWeight.w800,
                      ),
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black.withOpacity(.2),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  tabs: const [
                    Tab(
                      child: Text(
                        'History',
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Transaction Summary',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            HistoryTab(),
            Center(
              child: Text("Oops. nothing to see here!"),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  bool _showFab = true;
  final Duration _animationDuration = const Duration(milliseconds: 250);
  final ScrollController _scrollController = ScrollController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _stimulateNetworkRequest();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

// hide floating action button on scroll event
  void _scrollListener() {
    final ScrollDirection direction =
        _scrollController.position.userScrollDirection;
    setState(() {
      if (direction == ScrollDirection.reverse) {
        _showFab = false;
      } else if (direction == ScrollDirection.forward) {
        _showFab = true;
      }
    });
  }

// stimulate network request to show loading indicator briefly
  void _stimulateNetworkRequest() async {
    _showFab = false;
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
      _showFab = true;
    });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SendNewButton(
        onPressed: () {},
        showFab: _showFab,
        animationDuration: _animationDuration,
      ),
      body: isLoading
          // show progress indicator or transaction history depending
          // on the state of the stimulated network request
          ? const Center(
              child: CircularProgressIndicator(
                color: AppPalette.teal,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: SearchField(),
                        ),
                        SizedBox(
                          height: 45,
                          width: 45,
                          child: SvgPicture.asset(AppDrawables.icFilter),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final history = historyList[index];
                        return TransactionHistoryList(history: history);
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemCount: historyList.length,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
