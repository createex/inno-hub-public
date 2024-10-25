// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class StartupProfileNewModel {
//   String? profileImage;
//   String? startUpName;
//   String? startUpField;
//   String? startUpLocation;
//   String? startUpWebsite;
//   String? startUpUserName;
//   String? companyOverview;
//   String? challenges;
//   String? vision;
//   String? lookingFor;
//   String? productStatus;
//   String? technology;
//   String? marketAndCustomers;
//   String? targetMarket;
//   String? companySize;
//   String? foundingAndGrowth;
//   String? foundingStage;
//   String? investStage;
//   String? team;
//
//   StartupProfileNewModel({
//     this.profileImage,
//     this.startUpName,
//     this.startUpField,
//     this.startUpLocation,
//     this.startUpWebsite,
//     this.startUpUserName,
//     this.companyOverview,
//     this.challenges,
//     this.vision,
//     this.lookingFor,
//     this.productStatus,
//     this.technology,
//     this.marketAndCustomers,
//     this.targetMarket,
//     this.companySize,
//     this.foundingAndGrowth,
//     this.foundingStage,
//     this.investStage,
//     this.team,
//   });
//
//   factory StartupProfileNewModel.fromDocumentSnapshot(DocumentSnapshot doc) {
//     return StartupProfileNewModel(
//       profileImage: doc['profileImage'],
//       startUpName: doc['startUpName'],
//       startUpField: doc['startUpField'],
//       startUpLocation: doc['startUpLocation'],
//       startUpWebsite: doc['startUpWebsite'],
//       startUpUserName: doc['startUpUserName'],
//       companyOverview: doc['companyOverview'],
//       challenges: doc['challenges'],
//       vision: doc['vision'],
//       lookingFor: doc['lookingFor'],
//       productStatus: doc['productStatus'],
//       technology: doc['technology'],
//       marketAndCustomers: doc['marketAndCustomers'],
//       targetMarket: doc['targetMarket'],
//       companySize: doc['companySize'],
//       foundingAndGrowth: doc['foundingAndGrowth'],
//       foundingStage: doc['foundingStage'],
//       investStage: doc['investStage'],
//       team: doc['team'],
//     );
//   }
// }
