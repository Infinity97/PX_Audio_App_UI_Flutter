import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_youtube/src/data/repository/impl/notifications_repository_impl.dart';
import 'package:flutter_ecommerce_youtube/src/domain/dto/request/notification_request_entity.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/notification/notification_bloc/bloc.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/app_bar.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/independent/stateful_wrapper_widget.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/notification_widget.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/enums/notification_type.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => NotificationBloc(
          notificationsRepository: NotificationRepositoryImpl()),
      child: Scaffold(
        appBar: AppBarWidget(
          titleText: "Notifications",
          showCartIcon: true,
          showSearchIcon: true,
        ),
        body: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            if (state is InitialNotificationState) {
              BlocProvider.of<NotificationBloc>(context)
                  .add(GetListOfNotification(userId: "Soemthing"));
              return _buildLoadingPage();
            } else if (state is LoadingNotificationState) {
              return _buildLoadingPage();
            } else if (state is LoadedNotificationState) {
              return _notificationPage(state.notificationRequestEntity);
            } else if (state is ErrorNotificationState) {
              return _showError(state.message);
            } else {
              return _showError("Error");
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoadingPage() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _notificationPage(
      NotificationRequestEntity notificationRequestEntity) {
    return ListView.builder(
        itemCount: notificationRequestEntity.notificationCount,
        itemBuilder: (BuildContext context, index) {
          return NotificationWidget(
            title: notificationRequestEntity.listOfNotification[index].title,
            notificationType: NotificationTypeExtensions.getEnum(
                notificationRequestEntity
                    .listOfNotification[index].notificationType),
            callToActionTextLeft: notificationRequestEntity
                .listOfNotification[index].callToActionTextLeft,
            callToActionTextRight: notificationRequestEntity
                .listOfNotification[index].callToActionTextRight,
            date: notificationRequestEntity.listOfNotification[index].date,
            description:
                notificationRequestEntity.listOfNotification[index].description,
            imageUrl:
                notificationRequestEntity.listOfNotification[index].imageUrl,
          );
        });
  }

  Widget _showError(String message) {
    return Center(
      child: Text("We cannot find any Notification For You!!!"),
    );
  }
}
