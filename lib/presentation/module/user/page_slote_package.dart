import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/firebase/booking_controller.dart';
import 'package:hopehub/presentation/module/user/payment.dart';
import 'package:provider/provider.dart';

class SlotePackagePage extends StatelessWidget {
  String name;
  String email;
  String whatsappnumber;
  String drid;
  String drName;

  SlotePackagePage(
      {super.key,
      required this.drName,
      required this.drid,
      required this.email,
      required this.name,
      required this.whatsappnumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 20,
            )),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20), child: Divider()),
        toolbarHeight: 50,
        title: Text(
          "Booking",
          style: GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 17),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Icon(
                  Icons.access_time_rounded,
                  color: Colors.amber[900],
                  size: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("Time Slots:",
                      style: GoogleFonts.inknutAntiqua(
                          color: Colors.amber[900], fontSize: 20)),
                ),
              ],
            ),
          ),
          Consumer<BookingController>(builder: (context, controller, child) {
            return Expanded(
              child: FutureBuilder(
                  future: controller.init(
                      drName, name, drid, email, whatsappnumber),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return BookingCalendar(
                      bookingService: controller.mockBookingService!,
                      getBookingStream: controller.getBookingStreamMock,
                      uploadBooking: ({required newBooking}) {
                        return controller
                            .uploadBookingMock(newBooking: newBooking)
                            .then((value) =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => pay(
                                          newBooking: value,
                                        ))));
                      },
                      pauseSlots: controller.generatePauseSlots(),
                      convertStreamResultToDateTimeRanges:
                          controller.convertStreamResultMock,
                      pauseSlotText: 'BREAK',
                      hideBreakTime: false,
                      loadingWidget: const Text('Fetching data...'),
                      uploadingWidget:
                          const Center(child: CircularProgressIndicator()),
                      locale: 'en_US',
                      startingDayOfWeek: StartingDayOfWeek.tuesday,
                      wholeDayIsBookedWidget: const Text(
                          'Sorry, for this day everything is booked'),
                    );
                  }),
            );
          }),
        ],
      ),
    );
  }
}
