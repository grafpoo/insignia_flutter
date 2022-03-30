import 'package:insignia_flutter/model/insignia.dart';

class InsigniaLists {
  static const String USA_NAME = "Army";
  static const String USN_NAME = "Navy";
  static const String USAF_NAME = "Air Force";
  static const String USMC_NAME = "Marine Corps";
  static const String USCG_NAME = "Coast Guard";
  static const String ALL = "All";
  // List<String> _listKeys = ["USA", "USN", "USAF", "USMC", "USCG", ALL];

  Map<String, List<Insignia>> _insigniaLists;
  List<Insignia> getInsigniaList(String key) => _insigniaLists[key];

  InsigniaLists() {
    // good grief, this is needlessly complicated
    _insigniaLists = Map();
    _insigniaLists[USA_NAME] = createUsaInsigniaList();
    _insigniaLists[USN_NAME] = createUsnInsigniaList();
    _insigniaLists[USAF_NAME] = createUsafInsigniaList();
    _insigniaLists[USMC_NAME] = createUsmcInsigniaList();
    _insigniaLists[USCG_NAME] = createUscgInsigniaList();
    List<Insignia> allList = createUsaInsigniaList();
    addDedupedToList(allList, _insigniaLists[USN_NAME]);
    addDedupedToList(allList, _insigniaLists[USAF_NAME]);
    addDedupedToList(allList, _insigniaLists[USMC_NAME]);
    addDedupedToList(allList, _insigniaLists[USCG_NAME]);
    _insigniaLists[ALL] = allList;
  }

  void addDedupedToList(List<Insignia> allList, List<Insignia> newInsigniaList) {
    newInsigniaList.forEach((newInsignia) {
      bool merged = false;
      allList.forEach((allInsignia) {
        if (allInsignia.imageEquals(newInsignia)) {
          merged = true;
          allInsignia.branch = allInsignia.branch + "/" + newInsignia.branch;
          allInsignia.eoLevel = allInsignia.eoLevel + "/" + newInsignia.eoLevel;
          allInsignia.rank = allInsignia.rank + "/" + newInsignia.rank;
        }
      });
      if (!merged) {
        // add new one to list
        allList.add(newInsignia);
      }
    });
  }

  List<Insignia> createUsafInsigniaList() {
    return []
      ..add(Insignia("USAF", "E-1", "Airman Basic", "C", "no_insignia.png"))
      ..add(Insignia("USAF", "E-2", "Airman", "C", "USAF_E2_OR2_AM.png"))
      ..add(Insignia("USAF", "E-3", "Airman First Class", "C", "USAF_E3_OR3_AM1.png"))
      ..add(Insignia("USAF", "E-4", "Senior Airman", "C", "USAF_E4_OR4_SAM.png"))
      ..add(Insignia("USAF", "E-5", "Staff Sergeant", "C", "USAF_E5_OR5_SSGT.png"))
      ..add(Insignia("USAF", "E-6", "Technical Sergeant", "C", "USAF_E6_OR6_TSGT.png"))
      ..add(Insignia("USAF", "E-7", "Master Sergeant", "C", "USAF_E7_OR7_MSGT.png"))
      ..add(Insignia("USAF", "E-8", "Senior Master Sergeant", "C", "USAF_E8_OR8_SMSGT.png"))
      ..add(Insignia("USAF", "E-9", "Chief Master Sergeant", "C", "USAF_E9_OR9_CMSGT.png"))
      ..add(Insignia("USAF", "E-9", "Command Chief Master Sergeant", "C", "USAF_E9_OR9_CCMS.png"))
      ..add(Insignia("USAF", "E-9", "Chief Master Sergeant of the Air Force", "C", "USAF_E9_OR9_CMSAF.png"))
      ..add(Insignia("USAF", "O-1", "Second Lieutenant", "C", "US_O1.png"))
      ..add(Insignia("USAF", "O-2", "First Lieutenant", "C", "US_O2.png"))
      ..add(Insignia("USAF", "O-3", "Captain", "C", "US_O3.png"))
      ..add(Insignia("USAF", "O-4", "Major", "C", "US_O4.png"))
      ..add(Insignia("USAF", "O-5", "Lieutenant Colonel", "C", "US_O5.png"))
      ..add(Insignia("USAF", "O-6", "Colonel", "C", "US_O6.png"))
      ..add(Insignia("USAF", "O-7", "Brigadier General", "C", "US_O7.png"))
      ..add(Insignia("USAF", "O-8", "Major General", "C", "US_O8.png"))
      ..add(Insignia("USAF", "O-9", "Lieutenant General", "C", "US_O9.png"))
      ..add(Insignia("USAF", "O-10", "General", "C", "US_O10.png"))
      ..add(Insignia("USAF", "O-11", "General of the Air Force", "C", "US_O11.png"));
  }

  List<Insignia> createUsaInsigniaList() {
    return []
      ..add(Insignia("USA", "E-1", "Private", "C", "no_insignia.png"))
      ..add(Insignia("USA", "E-2", "Private Second Class", "C", "USA_E2_OR2_PV2.png"))
      ..add(Insignia("USA", "E-3", "Private First Class", "C", "USA_E3_OR3_PFC.png"))
      ..add(Insignia("USA", "E-4", "Specialist", "C", "USA_E4_OR4_SPC.png"))
      ..add(Insignia("USA", "E-4", "Corporal", "C", "USA_E4_OR4_CPL.png"))
      ..add(Insignia("USA", "E-5", "Sergeant", "C", "USA_E5_OR5_SGT.png"))
      ..add(Insignia("USA", "E-6", "Staff Sergeant", "C", "USA_E6_OR6_SSG.png"))
      ..add(Insignia("USA", "E-7", "Sergeant First Class", "C", "USA_E7_OR7_SFC.png"))
      ..add(Insignia("USA", "E-8", "First Sergeant", "C", "USA_E8_OR8_1SG.png"))
      ..add(
        Insignia("USA", "E-8", "Master Sergeant", "C", "USA_E8_OR8_MSG.png"))
      ..add(Insignia("USA", "E-9", "Sergeant Major", "C", "USA_E9_OR9_SGM.png"))
      ..add(Insignia("USA", "E-9", "Command Sergeant Major", "C", "USA_E9_OR9_CSM.png"))
      ..add(Insignia("USA", "E-9", "Sergeant Major of the Army", "C", "USA_E9_OR9_SMA.png"))
      ..add(Insignia("USA", "W-1", "Warrant Officer 1", "C", "USA_W1_CW1.png"))
      ..add(Insignia("USA", "W-2", "Chief Warrant Officer 2", "C", "USA_W2_CW2.png"))
      ..add(Insignia("USA", "W-3", "Chief Warrant Officer 3", "C", "USA_W3_CW3.png"))
      ..add(Insignia("USA", "W-4", "Chief Warrant Officer 4", "C", "USA_W4_CW4.png"))
      ..add(Insignia("USA", "W-5", "Chief Warrant Officer 5", "C", "USA_W5_CW5.png"))
      ..add(Insignia("USA", "O-1", "Second Lieutenant", "C", "US_O1.png"))
      ..add(Insignia("USA", "O-2", "First Lieutenant", "C", "US_O2.png"))
      ..add(Insignia("USA", "O-3", "Captain", "C", "US_O3.png"))
      ..add(Insignia("USA", "O-4", "Major", "C", "US_O4.png"))
      ..add(Insignia("USA", "O-5", "Lieutenant Colonel", "C", "US_O5.png"))
      ..add(Insignia("USA", "O-6", "Colonel", "C", "US_O6.png"))
      ..add(Insignia("USA", "O-7", "Brigadier General", "C", "US_O7.png"))
      ..add(Insignia("USA", "O-8", "Major General", "C", "US_O8.png"))
      ..add(Insignia("USA", "O-9", "Lieutenant General", "C", "US_O9.png"))
      ..add(Insignia("USA", "O-10", "General", "C", "US_O10.png"))
      ..add(Insignia("USA", "O-11", "General of the Army", "C", "US_O11.png"));
  }

  List<Insignia> createUsmcInsigniaList() {
    return []
      ..add(Insignia("USMC", "E-1", "Private", "C", "no_insignia.png"))
      ..add(Insignia("USMC", "E-2", "Private First Class", "C", "USMC_E2_PFC.png"))
      ..add(Insignia("USMC", "E-3", "Lance Corporal", "C", "USMC_E3_LCPL.png"))
      ..add(Insignia("USMC", "E-4", "Corporal", "C", "USMC_E4_CPL.png"))
      ..add(Insignia("USMC", "E-5", "Sergeant", "C", "USMC_E5_SGT.png"))
      ..add(Insignia("USMC", "E-6", "Staff Sergeant", "C", "USMC_E6_SSGT.png"))
      ..add(Insignia("USMC", "E-7", "Gunnery Sergeant", "C", "USMC_E7_GSGT.png"))
      ..add(Insignia("USMC", "E-8", "First Sergeant", "C", "USMC_E8_1SG.png"))
      ..add(Insignia("USMC", "E-8", "Master Sergeant", "C", "USMC_E8_MSGT.png"))
      ..add(Insignia("USMC", "E-9", "Master Gunnery Sergeant", "C", "USMC_E9_MGSGT.png"))
      ..add(Insignia("USMC", "E-9", "Sergeant Major", "C", "USMC_E9_SM.png"))
      ..add(Insignia("USMC", "E-9", "Sergeant Major of the Marine Corps", "C", "USMC_E9_SMMC.png"))
      ..add(Insignia("USMC", "W-1", "Warrant Officer 1", "C", "USMC_W1_WO1.png"))
      ..add(Insignia("USMC", "W-2", "Chief Warrant Officer 2", "C", "USMC_W2_CWO2.png"))
      ..add(Insignia("USMC", "W-3", "Chief Warrant Officer 3", "C", "USMC_W3_CWO3.png"))
      ..add(Insignia("USMC", "W-4", "Chief Warrant Officer 4", "C", "USMC_W4_CWO4.png"))
      ..add(Insignia("USMC", "W-5", "Chief Warrant Officer 5", "C", "USMC_W5_CWO5.png"))
      ..add(Insignia("USMC", "O-1", "Second Lieutenant", "C", "US_O1.png"))
      ..add(Insignia("USMC", "O-2", "First Lieutenant", "C", "US_O2.png"))
      ..add(Insignia("USMC", "O-3", "Captain", "C", "US_O3.png"))
      ..add(Insignia("USMC", "O-4", "Major", "C", "US_O4.png"))
      ..add(Insignia("USMC", "O-5", "Lieutenant Colonel", "C", "US_O5.png"))
      ..add(Insignia("USMC", "O-6", "Colonel", "C", "US_O6.png"))
      ..add(Insignia("USMC", "O-7", "Brigadier General", "C", "US_O7.png"))
      ..add(Insignia("USMC", "O-8", "Major General", "C", "US_O8.png"))
      ..add(Insignia("USMC", "O-9", "Lieutenant General", "C", "US_O9.png"))
      ..add(Insignia("USMC", "O-10", "General", "C", "US_O10.png"));
  }

  List<Insignia> createUsnInsigniaList() {
    return []
      ..add(Insignia("USN", "E-1", "Seaman Recruit", "C", "no_insignia.png"))
      ..add(Insignia("USN", "E-2", "Seaman Apprentice", "C", "USN_E2_SA_collar.png"))
      ..add(Insignia("USN", "E-2", "Seaman Apprentice", "C", "USN_E2_SA.png"))
      ..add(Insignia("USN", "E-2", "Fireman Apprentice", "C", "USCG_E2_FA.png"))
      ..add(Insignia("USN", "E-2", "Airman Apprentice", "C", "USCG_E2_AA.png"))
      ..add(Insignia("USN", "E-2", "Constructionman Apprentice", "C", "USCG_E2_CA.png"))
      ..add(Insignia("USN", "E-3", "Seaman", "C", "USN_E3_SM_collar.png"))
      ..add(Insignia("USN", "E-3", "Seaman", "C", "USN_E3_SM.png"))
      ..add(Insignia("USN", "E-3", "Airman", "C", "USN_E3_AM.png"))
      ..add(Insignia("USN", "E-3", "Fireman", "C", "USN_E3_FM.png"))
      ..add(Insignia("USN", "E-3", "Constructionman", "C", "USN_E3_CM.png"))
      ..add(Insignia("USN", "E-4", "Petty Officer Third Class", "C", "USN_E4_PO3.png"))
      ..add(Insignia("USN", "E-5", "Petty Officer Second Class", "C", "USN_E5_PO2.png"))
      ..add(Insignia("USN", "E-6", "Petty Officer First Class", "C", "USN_E6_PO1.png"))
      ..add(Insignia("USN", "E-7", "Chief Petty Officer", "C", "USN_E7_CPO.png"))
      ..add(Insignia("USN", "E-8", "Senior Chief Petty Officer", "C", "USN_E8_SCPO.png"))
      ..add(Insignia("USN", "E-8", "Command Senior Chief Petty Officer", "C", "USN_E8_CMDCS.png"))
      ..add(Insignia("USN", "E-9", "Master Chief Petty Officer", "C", "USN_E9_MCPO.png"))
      ..add(Insignia("USN", "E-9", "Command Master Chief Petty Officer", "C", "USN_E9_CMCPO.png"))
      ..add(Insignia("USN", "E-9", "Fleet Master Chief Petty Officer", "C", "USN_E9_FMCPO.png"))
      ..add(Insignia("USN", "E-9", "Master Chief Petty Officer of the Navy", "C", "USN_E9_MCPON.png"))
      ..add(Insignia("USN", "W-1", "Warrant Officer One", "C", "US_W1_WO1.png"))
      ..add(Insignia("USN", "W-1", "Warrant Officer One", "S", "USN_W1_WO1_s.png"))
      ..add(Insignia("USN", "W-2", "Chief Warrant Officer Two", "C", "US_W2_CW2.png"))
      ..add(Insignia("USN", "W-2", "Chief Warrant Officer Two", "S", "USN_W2_CW2_s.png"))
      ..add(Insignia("USN", "W-3", "Chief Warrant Officer Three", "C", "US_W3_CW3.png"))
      ..add(Insignia("USN", "W-3", "Chief Warrant Officer Three", "S", "USN_W3_CW3_s.png"))
      ..add(Insignia("USN", "W-4", "Chief Warrant Officer Four", "S", "USN_W4_CW4_s.png"))
      ..add(Insignia("USN", "W-5", "Chief Warrant Officer Five", "C", "US_W5_CW5.png"))
      ..add(Insignia("USN", "W-5", "Chief Warrant Officer Five", "S", "USN_W5_CW5_s.png"))
      ..add(Insignia("USN", "Student", "", "Midshipman/Officer CandidatE-S", "USN_SO_OC_s.png"))
      ..add(Insignia("USN", "O-1", "Ensign", "C", "US_O1.png"))
      ..add(Insignia("USN", "O-1", "Ensign", "S", "USN_O1_s.png"))
      ..add(Insignia("USN", "O-2", "Lieutenant (Junior Grade)", "C", "US_O2.png"))
      ..add(Insignia("USN", "O-2", "Lieutenant (Junior Grade)", "S", "USN_O2_s.png"))
      ..add(Insignia("USN", "O-3", "Lieutenant", "C", "US_O3.png"))
      ..add(Insignia("USN", "O-3", "Lieutenant", "S", "USN_O3_s.png"))
      ..add(Insignia("USN", "O-4", "Lieutenant Commander", "C", "US_O4.png"))
      ..add(Insignia("USN", "O-4", "Lieutenant Commander", "S", "USN_O4_s.png"))
      ..add(Insignia("USN", "O-5", "Commander", "C", "US_O5.png"))
      ..add(Insignia("USN", "O-5", "Commander", "S", "USN_O5_s.png"))
      ..add(Insignia("USN", "O-6", "Captain", "C", "US_O6.png"))
      ..add(Insignia("USN", "O-6", "Captain", "S", "USN_O6_s.png"))
      ..add(Insignia("USN", "O-7", "Rear Admiral (lower half)", "C", "US_O7.png"))
      ..add(Insignia("USN", "O-7", "Rear Admiral (lower half)", "S", "USN_O7_s.png"))
      ..add(Insignia("USN", "O-8", "Rear Admiral", "C", "US_O8.png"))
      ..add(Insignia("USN", "O-8", "Rear Admiral", "S", "USN_O8_s.png"))
      ..add(Insignia("USN", "O-9", "Vice Admiral", "C", "US_O9.png"))
      ..add(Insignia("USN", "O-9", "Vice Admiral", "S", "USN_O9_s.png"))
      ..add(Insignia("USN", "O-10", "Admiral", "C", "US_O10.png"))
      ..add(Insignia("USN", "O-10", "Admiral", "S", "USN_O10_s.png"))
      ..add(Insignia("USN", "O-11", "Fleet Admiral", "C", "US_O11.png"))
      ..add(Insignia("USN", "O-11", "Fleet Admiral", "S", "USN_O11_s.png"))
      ..add(Insignia("USN", "SG", "Admiral of the Navy", "S", "USN_SG_AN_s.png"));
  }

  List<Insignia> createUscgInsigniaList() {
    return []
      ..add(Insignia("USCG", "E-1", "Seaman Recruit", "C", "no_insignia.png"))
      ..add(Insignia("USCG", "E-2", "Seaman Apprentice", "C", "USN_E2_SA_collar.png"))
      ..add(Insignia("USCG", "E-2", "Seaman Apprentice", "C", "USN_E2_SA.png"))
      ..add(Insignia("USCG", "E-2", "Fireman Apprentice", "C", "USCG_E2_FA.png"))
      ..add(Insignia("USCG", "E-2", "Airman Apprentice", "C", "USCG_E2_AA.png"))
      ..add(Insignia("USCG", "E-2", "Constructionman Apprentice", "C", "USCG_E2_CA.png"))
      ..add(Insignia("USCG", "E-3", "Seaman", "C", "USN_E3_SM_collar.png"))
      ..add(Insignia("USCG", "E-3", "Seaman", "C", "USN_E3_SM.png"))
      ..add(Insignia("USCG", "E-3", "Airman", "C", "USN_E3_AM.png"))
      ..add(Insignia("USCG", "E-3", "Fireman", "C", "USN_E3_FM.png"))
      ..add(Insignia("USCG", "E-3", "Constructionman", "C", "USN_E3_CM.png"))
      ..add(Insignia("USCG", "E-4", "Petty Officer Third Class", "C", "USCG_E4_PO3.png"))
      ..add(Insignia("USCG", "E-5", "Petty Officer Second Class", "C", "USCG_E5_PO2.png"))
      ..add(Insignia("USCG", "E-6", "Petty Officer First Class", "C", "USCG_E6_PO1.png"))
      ..add(Insignia("USCG", "E-7", "Chief Petty Officer", "C", "USCG_E7_CPO.png"))
      ..add(Insignia("USCG", "E-8", "Senior Chief Petty Officer", "C", "USCG_E8_SCPO.png"))
      ..add(Insignia("USCG", "E-9", "Master Chief Petty Officer", "C", "USCG_E9_MCPO.png"))
      ..add(Insignia("USCG", "E-9", "Command Master Chief Petty Officer", "C", "USCG_E9_MCPO.png"))
      ..add(Insignia("USCG", "E-9", "Master Chief Petty Officer of the Coast Guard Reserve Force or Area/DCO/DCMS Command Master Chief Petty Officer", "C", "USCG_E9_MCPO.png"))
      ..add(Insignia("USCG", "E-9", "Master Chief Petty Officer of the Coast Guard", "C", "USCG_E9_MCPOCG.png"))
      ..add(Insignia("USCG", "W", "2", "Chief Warrant Officer TwO-C", "US_W2_CW2.png"))
      ..add(Insignia("USCG", "W", "2", "Chief Warrant Officer TwO-S", "USCG_W2_CW2_s.png"))
      ..add(Insignia("USCG", "W", "3", "Chief Warrant Officer ThreE-C", "US_W3_CW3.png"))
      ..add(Insignia("USCG", "W", "3", "Chief Warrant Officer ThreE-S", "USCG_W3_CW3_s.png"))
      ..add(Insignia("USCG", "W-4", "Chief Warrant Officer Four", "C", "US_W4_CW4.png"))
      ..add(Insignia("USCG", "W-4", "Chief Warrant Officer Four", "S", "USCG_W4_CW4_s.png"))
      ..add(Insignia("USCG", "O-1", "Ensign", "C", "US_O1.png"))
      ..add(Insignia("USCG", "O-1", "Ensign", "S", "USCG_O1_s.png"))
      ..add(Insignia("USCG", "O-2", "Lieutenant (Junior Grade)", "C", "US_O2.png"))
      ..add(Insignia("USCG", "O-2", "Lieutenant (Junior Grade)", "S", "USCG_O2_s.png"))
      ..add(Insignia("USCG", "O-3", "Lieutenant", "C", "US_O3.png"))
      ..add(Insignia("USCG", "O-3", "Lieutenant", "S", "USCG_O3_s.png"))
      ..add(Insignia("USCG", "O-4", "Lieutenant Commander", "C", "US_O4.png"))
      ..add(Insignia("USCG", "O-4", "Lieutenant Commander", "S", "USCG_O4_s.png"))
      ..add(Insignia("USCG", "O-5", "Commander", "C", "US_O5.png"))
      ..add(Insignia("USCG", "O-5", "Commander", "S", "USCG_O5_s.png"))
      ..add(Insignia("USCG", "O-6", "Captain", "C", "US_O6.png"))
      ..add(Insignia("USCG", "O-6", "Captain", "S", "USCG_O6_s.png"))
      ..add(Insignia("USCG", "O-7", "Rear Admiral (lower half)", "C", "US_O7.png"))
      ..add(Insignia("USCG", "O-7", "Rear Admiral (lower half)", "S", "USCG_O7_s.png"))
      ..add(Insignia("USCG", "O-8", "Rear Admiral", "C", "US_O8.png"))
      ..add(Insignia("USCG", "O-8", "Rear Admiral", "S", "USCG_O8_s.png"))
      ..add(Insignia("USCG", "O-9", "Vice Admiral", "C", "US_O9.png"))
      ..add(Insignia("USCG", "O-9", "Vice Admiral", "S", "USCG_O9_s.png"))
      ..add(Insignia("USCG", "O-10", "Admiral", "C", "US_O10.png"))
      ..add(Insignia("USCG", "O-10", "Admiral", "S", "USCG_O10_s.png"));
  }

}
