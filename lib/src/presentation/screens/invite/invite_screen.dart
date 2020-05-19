import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_youtube/src/data/models/users/users.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/invite/invite_bloc/bloc.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/bar_button.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/independent/stateful_wrapper_widget.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/independent/tile_widget.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/submit_button.dart';
import 'package:flutter_ecommerce_youtube/src/utils/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';

class InviteScreen extends StatelessWidget {
  Function _onInit(BuildContext context) {
    print("Updating the Event inside Invite Screen");
    BlocProvider.of<InviteBloc>(context)
        .add(GetReferralCode(userId: "Something"));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical * 80,
      width: SizeConfig.blockSizeHorizontal * 100,
      color: ColorConstants.lightGrey,
      child: Stack(
        children: <Widget>[
          StatefulWrapperWidget(
            onInit: _onInit(context),
            child: Container(),
          ),
          Image(
            height: SizeConfig.blockSizeVertical * 50,
            width: double.infinity,
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
          ),
          BlocListener<InviteBloc, InviteState>(
            listener: (context, state) {
              if (state is ErrorInviteState) {
                _buildLoadingInviteText();
              }
            },
            child: _blocInviteText(),
          ),
          _shareButton(),
          Positioned(
            bottom: SizeConfig.blockSizeVertical * 30,
            child: ReferralProcessFlow(),
          ),
        ],
      ),
    );
  }

  Widget _blocInviteText() {
    return BlocBuilder<InviteBloc, InviteState>(builder: (context, state) {
      if (state is InitialInviteState) {
        return _buildInitialInviteText();
      } else if (state is LoadingInviteState) {
        return _buildLoadingInviteText();
      } else if (state is LoadedInviteState) {
        return _buildLoadedInviteText(state.referralCode);
      }
    });
  }

  Widget _buildInitialInviteText() {
    return Center(child: Text("Yo Mama"));
  }

  Widget _buildLoadingInviteText() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildLoadedInviteText(String referralCode) {
    return _referralCodeBox(referralCode);
  }

  Widget _shareButton() {
    return Positioned(
      bottom: SizeConfig.blockSizeVertical,
      right: 10,
      left: 10,
      child: BarButton(
        title: "Share And Earn",
        height: SizeConfig.blockSizeVertical * 8,
        width: SizeConfig.blockSizeHorizontal * 80,
        fontSize: 23,
        onPressed: () {
          //TODO: To Call the Share Functionality on Click using share Flutter Package.
        },
      ),
    );
  }

  Widget _referralCodeBox(String referralCode) {
    return Positioned(
      bottom: SizeConfig.blockSizeVertical * 10,
      right: 10,
      left: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Share Your Code Below to win Exciting Cash Rewards",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal * 80,
            height: SizeConfig.blockSizeVertical * 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              border: Border.all(color: ColorConstants.lightBlue, width: 4),
            ),
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical,
                horizontal: SizeConfig.blockSizeHorizontal * 20),
            child: Center(
                child: Text(
              "${referralCode}",
              style: TextStyle(
                  color: ColorConstants.lightBlue,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            )),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          )
        ],
      ),
    );
  }
}

class ReferralProcessFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2),
      child: Row(
        children: <Widget>[
          _rectangularWidget(text: "Share the Referral Code with Your Friend"),
          Container(
            height: SizeConfig.blockSizeVertical * 0.5,
            width: SizeConfig.blockSizeHorizontal * 5,
            color: ColorConstants.white,
          ),
          _rectangularWidget(
              text: "Friend Buys a product using Your Referral Code"),
          Container(
            height: SizeConfig.blockSizeVertical * 0.5,
            width: SizeConfig.blockSizeHorizontal * 5,
            color: ColorConstants.white,
          ),
          _rectangularWidget(text: "You get Cash directly to Your Account"),
          Container(
            height: SizeConfig.blockSizeVertical * 0.5,
            width: SizeConfig.blockSizeHorizontal * 5,
            color: ColorConstants.white,
          ),
          _rectangularWidget(
              text: "Your Friend gets Cash directly to His Account"),
        ],
      ),
    );
  }

  Widget _rectangularWidget(
      {@required String text,
      Color color,
      Color textColor,
      double width,
      double height,
      Color outlineColor}) {
    return Container(
      height: SizeConfig.blockSizeVertical * 13,
      width: SizeConfig.blockSizeHorizontal * 20,
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeHorizontal,
          horizontal: SizeConfig.blockSizeHorizontal),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
          color: ColorConstants.white,
          width: SizeConfig.blockSizeHorizontal * 0.5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: color ?? ColorConstants.veryLightBlue,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 3,
              color: ColorConstants.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
