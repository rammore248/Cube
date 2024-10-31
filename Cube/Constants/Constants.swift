//
//  Constants.swift
//  Cube
//
//  Created by XTSW-MAC-1137-2 on 02/09/24.
//

enum APIConstants {
    
    //#define  BASE_URL_PATH                        @"http://www.xanadutec.net/cubeagent_webapi/api"
    //
    //#define  BASE_URL_PATH                        @"http://192.168.3.150:8081/CubeAPI/api"
    //#define  CHECK_DEVICE_REGISTRATION            @"MobileCheckDeviceRegistration"
    //#define  AUTHENTICATE_API                     @"MobileAuthenticate"
    //#define  ACCEPT_PIN_API                       @"MobileAcceptPIN"
    //#define  VALIDATE_PIN_API                     @"MobileValidatePIN"
    //#define  DICTATIONS_INSERT_API                @"MobileDictationsInsert"
    //#define  DATA_SYNCHRONISATION_API             @"MobileDataSynchronisation"
    //#define  FILE_UPLOAD_API                      @"MobileFileUpload"
    //#define  PIN_CANGE_API                        @"MobilePINChange"
    
    //#define  BASE_URL_PATH                        @"http://www.xanadutec.net/cubeagent_webapi/api"
    //appointment live on 1. "https://www.cubescribe.com/cubeagent_webapi/api" and 2. "https://www.cubescribeonline.com/CubeApi4Intranet/api" currently for test(since we've added completed doc apis in 2 only)
    static let  BASE_URL_PATH_1                      = "https://www.cubescribeonline.com/CubeApi4Intranet/api"// demo db
    static let  BASE_URL_PATH                        = "https://www.cubescribe.com/cubeagent_webapi/api"//live
    
    
    //#define  BASE_URL_PATH                         = "http://192.168.3.156:8081/CubeAPI/api"
    static let  CHECK_DEVICE_REGISTRATION            = "encrdecr_MobileCheckDeviceRegistration"
    static let  AUTHENTICATE_API                     = "encrdecr_MobileAuthenticate"
    static let  ACCEPT_PIN_API                       = "encrdecr_MobileAcceptPIN"
    static let  VALIDATE_PIN_API                     = "encrdecr_MobileValidatePIN"
    static let  DICTATIONS_INSERT_API                = "encrdecr_MobileDictationsInsert"
    static let  DATA_SYNCHRONISATION_API             = "encrdecr_MobileDataSynchronisation"
    //#define  FILE_UPLOAD_API                       = "encrdecr_MobileFileUpload"
    static let  FILE_UPLOAD_API                      = "encrdecr_MobileFileUpload"
    
    static let  PIN_CANGE_API                        = "encrdecr_MobilePINChange"
    static let  FILE_DOWNLOAD_API                    = "encedecr_MobileDownloadDocFile"
    static let  SEND_DICTATION_IDS_API               = "encrdecr_MobileRequestForCompleteFiles"
    static let  SEND_COMMENT_API                     = "encdecr_MobileDocFileComment"
    static let  DOCX_FILE_UPLOAD_API                 = "encedecr_MobileUploadDocFile"
    static let  ACCEPY_TandC_API                     = "encedecr_MobileTermsAndConditions"
    static let  GET_APNTMNT_LIST_API                 = "encrdecr_MobileClinicList"
    static let  UPDATE_APNTMNT_STATUS_API            = "encrdecr_MobileAppointmentStatus"
    static let  GET_COMPLETED_DOC_LIST_API           = "encrdecr_MobileApproval"
    
    
    static let  MEETING_USER_ENDPOINT_API            = "http://liveklasserp.testbot.xyz/Sessions/join?m=91&p=532714&u="
    static let  MEETING_MENTOR_ENDPOINT              = "http://liveklasserp.testbot.xyz/Sessions/join?m=91&p=861720&u=";
    
    
    static let  SECRET_KEY                           = "cubemob"
    static let  POST                                 = "POST"
    static let  GET                                  = "GET"
    static let  PUT                                  = "PUT"
    static let  REQUEST_PARAMETER                    = "requestParameter"
    static let  SUCCESS                              = "1000"
    static let  FAILURE                              = "1001"
    static let  VRS_LOCALE                           = "vrsLocale"
    static let  DICTATOR_NAME                        = "dictatorName"
    
    
    //NSNOTIFICATION
    
    static let NOTIFICATION_CHECK_DEVICE_REGISTRATION      = "notificationForMobileCheckDeviceRegistration"
    static let NOTIFICATION_AUTHENTICATE_API               = "notificationForMobileAuthenticate"
    static let NOTIFICATION_ACCEPT_PIN_API                 = "notificationForMobileAcceptPIN"
    static let NOTIFICATION_VALIDATE_PIN_API               = "notificationForMobileValidatePIN"
    static let NOTIFICATION_DICTATIONS_INSERT_API          = "notificationForMobileDictationsInsert"
    static let NOTIFICATION_DATA_SYNCHRONISATION_API       = "notificationForMobileDataSynchronisation"
    static let NOTIFICATION_FILE_UPLOAD_API                = "notificationForMobileFileUpload"
    static let NOTIFICATION_FILE_DOWNLOAD_API              = "notificationForMobileFileDownload"
    static let NOTIFICATION_SEND_DICTATION_IDS_API         = "notificationSendDictationIds"
    static let NOTIFICATION_ACCEPT_TANDC_API               = "notificationAcceptTandC"
    
    static let NOTIFICATION_PIN_CANGE_API                  = "notificationForMobilePINChange"
    static let NOTIFICATION_PAUSE_RECORDING                = "pauseRecording"
    static let NOTIFICATION_INTERNET_MESSAGE               = "internetMessage"
    static let NOTIFICATION_PAUSE_AUDIO_PALYER             = "pausePlayer"
    static let NOTIFICATION_DELETE_RECORDING               = "deleteRecording"
    static let NOTIFICATION_SAVE_RECORDING                 = "saveRecording"
    static let NOTIFICATION_FILE_IMPORTED                  = "fileImportingCompleted"
    static let NOTIFICATION_UPLOAD_NEXT_FILE               = "uploadNextFile"
    static let NOTIFICATION_SEND_COMMENT_API               = "commentNotification"
    static let NOTIFICATION_FILE_UPLOAD_CLICKED            = "fileUploadClicked"
    static let NOTIFICATION_STOP_VRS                       = "stopVRS"
    static let NOTIFICATION_GET_APNTMNT_LIST               = "notiGetApntmntList"
    static let NOTIFICATION_UPDATE_APNTMNT_STATUS          = "notiUpdateApntStatus"
    static let NOTIFICATION_COMPLETED_DOC_LIST             = "notiCompletedDocList"
    
    //Settimg Constants
    //
    static let SAVE_DICTATION_WAITING_SETTING         = "Save dictation waiting by"
    static let CONFIRM_BEFORE_SAVING_SETTING          = "Confirm before saving"
    static let CONFIRM_BEFORE_SAVING_SETTING_ALTERED  = "Confirm before saving alter"
    static let ALERT_BEFORE_RECORDING                 = "Alert before recording"
    static let BACK_TO_HOME_AFTER_DICTATION           = "Back to home after dictation"
    static let LOGIN_USING_FACE_TOUCH_ID              = "Login using face or touch id"
    static let RECORD_ABBREVIATION                    = "Record abbreviation"
    static let LOW_STORAGE_THRESHOLD                  = "Low storage threshold"
    static let PURGE_DELETED_DATA                     = "Purge data by"
    static let CHANGE_YOUR_PASSWORD                   = "Change your pin"
    static let DELETE_MESSAGE_DOCX                    = "Do you want to delete this file?"
    static let DELETE_MESSAGE                         = "Do you want to delete this recording?"
    static let DELETE_MESSAGE_MULTIPLES               = "Do you want to delete these recordings?"
    static let TRANSFER_MESSAGE                       = "Are you sure you want to transfer this recording?"
    static let TRANSFER_MESSAGE_MULTIPLES             = "Are you sure you want to transfer these recordings?"
    static let RESEND_MESSAGE                         = "Are you sure you want to resend this recording?"
    static let PAUSE_STOP_MESSAGE                     = "Recording is on.Please pause/stop the recording"
    static let MAXIMUM_RECORDING_LIMIT_MESSAGE        = "Recording duration length exceeded,please start new recording for further dictation"
    static let RECORDING_SAVED_MESSAGE                = "Recording duration length exceeded,your recording has been saved in awaiting transfer,please start new recording for further dictation"
    
    static let NO_INTERNET_TITLE_MESSAGE              = "No internet connection!"
    static let NO_INTERNET_DETAIL_MESSAGE             = "Please check your internet connection and try again."
    static let CURRENT_VESRION                        = "currentVersion"
    static let IS_DATE_FORMAT_UPDATED                 = "dateFormatUpdated"
    
    static let RECORDING_LIMIT                        = 3600
    static let ALERT_TAB_LOCATION                     = 3
    static let PURGE_DATA_DATE                        = "purgeDataDate"
    //#define APPLICATION_TERMINATE_CALLED            = "applicationTerminate"
    
    
    static let INCOMPLETE_TRANSFER_COUNT_BADGE        = "Incomplete Count"
    static let SELECTED_DEPARTMENT_NAME               = "Selected Department"
    static let SELECTED_DEPARTMENT_NAME_COPY          = "Selected Department Copy"
    static let AUDIO_FILES_FOLDER_NAME                = "Audio files"
    static let DOCX_FILES_FOLDER_NAME                 = "Downloads"
    static let DOC_VRS_FILES_FOLDER_NAME              = "VRSDOC files"
    static let DOC_VRS_TEXT_FILES_FOLDER_NAME         = "VRSAudio files"
    static let IS_VRS_ENABLE                          = "isVrsEnable"
    
    static let USER_PIN         = "userPIN"
    static let USER_ID         = "userId" //Username
    static let USER_PASS         = "userPassword"
    static let USER_ID_INT         = "userIdInt" //unique db userId generated by server
    //#define DATE_TIME_FORMAT                        = "MM-dd-yyyy HH:mm:ss"
    static let DATE_TIME_FORMAT                       = "yyyy-MM-dd HH:mm:ss"
    
    static let RESPONSE_CODE                          = "code"
    static let RESPONSE_PIN_VERIFY                    = "pinverify"
    static let RESPONSE_TC_FLAG                       = "AcceptTermFlag"
    static let RESPONSE_MESSAGE                       = "responseMessage"
    
    
    
    static let SHARED_GROUP_IDENTIFIER               = "group.com.coreFlexSolutions.CubeDictate"
    //#define MAC_ID                                 = "e0:2c:b2:eb:5a:8e"
    //#define MAC_ID                                 ="e0:2c:b2:ec:5a:8e"
    
    //#define MAC_ID                                 ="e0:2c:b2:ec:5a:8f"
    
    enum DownloadingStatus {
        case noDownload
        case downloading
        case downloaded
        case downloadedAndDeleted
    }
    
    enum DeleteStatus {
        case noDelete
        case deleted
    }
    
    enum UploadStatus {
        case noUpload
        case uploaded
    }
    
}
