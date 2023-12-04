; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [129 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [258 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 47
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 128
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 52
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 101
	i64 210515253464952879, ; 4: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 63
	i64 232391251801502327, ; 5: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 80
	i64 750875890346172408, ; 6: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 119
	i64 799765834175365804, ; 7: System.ComponentModel.dll => 0xb1956c9f18442ac => 94
	i64 805302231655005164, ; 8: hu\Microsoft.Maui.Controls.resources.dll => 0xb2d021ceea03bec => 12
	i64 870603111519317375, ; 9: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 57
	i64 872800313462103108, ; 10: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 68
	i64 1120440138749646132, ; 11: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 84
	i64 1301485588176585670, ; 12: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 56
	i64 1369545283391376210, ; 13: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 76
	i64 1476839205573959279, ; 14: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 106
	i64 1486715745332614827, ; 15: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 49
	i64 1513467482682125403, ; 16: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 127
	i64 1518315023656898250, ; 17: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 58
	i64 1537168428375924959, ; 18: System.Threading.Thread.dll => 0x15551e8a954ae0df => 119
	i64 1624659445732251991, ; 19: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 61
	i64 1628611045998245443, ; 20: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 73
	i64 1735388228521408345, ; 21: System.Net.Mail.dll => 0x181556663c69b759 => 105
	i64 1743969030606105336, ; 22: System.Memory.dll => 0x1833d297e88f2af8 => 103
	i64 1767386781656293639, ; 23: System.Private.Uri.dll => 0x188704e9f5582107 => 110
	i64 1795316252682057001, ; 24: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 60
	i64 1825687700144851180, ; 25: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 112
	i64 1827197370226629367, ; 26: EqInv.dll => 0x195b8253cae2daf7 => 87
	i64 1835311033149317475, ; 27: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 28: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 80
	i64 1881198190668717030, ; 29: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1920760634179481754, ; 30: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 50
	i64 1930726298510463061, ; 31: CommunityToolkit.Mvvm.dll => 0x1acb5156cd389055 => 37
	i64 1981742497975770890, ; 32: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 72
	i64 2262844636196693701, ; 33: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 68
	i64 2287834202362508563, ; 34: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 88
	i64 2329709569556905518, ; 35: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 71
	i64 2335503487726329082, ; 36: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 116
	i64 2470498323731680442, ; 37: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 64
	i64 2497223385847772520, ; 38: System.Runtime => 0x22a7eb7046413568 => 114
	i64 2547086958574651984, ; 39: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 59
	i64 2602673633151553063, ; 40: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2656907746661064104, ; 41: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 42
	i64 2662981627730767622, ; 42: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2895129759130297543, ; 43: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 44: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 84
	i64 3289520064315143713, ; 45: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 70
	i64 3311221304742556517, ; 46: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 108
	i64 3344514922410554693, ; 47: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 86
	i64 3429672777697402584, ; 48: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 52
	i64 3494946837667399002, ; 49: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 40
	i64 3522470458906976663, ; 50: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 81
	i64 3551103847008531295, ; 51: System.Private.CoreLib.dll => 0x31480e226177735f => 125
	i64 3567343442040498961, ; 52: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 53: System.Runtime.dll => 0x319037675df7e556 => 114
	i64 3638003163729360188, ; 54: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 41
	i64 3647754201059316852, ; 55: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 122
	i64 3655542548057982301, ; 56: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 40
	i64 3716579019761409177, ; 57: netstandard.dll => 0x3393f0ed5c8c5c99 => 124
	i64 3727469159507183293, ; 58: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 79
	i64 3869221888984012293, ; 59: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 44
	i64 3890352374528606784, ; 60: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 50
	i64 3933965368022646939, ; 61: System.Net.Requests => 0x369840a8bfadc09b => 107
	i64 3966267475168208030, ; 62: System.Memory => 0x370b03412596249e => 103
	i64 4070326265757318011, ; 63: da\Microsoft.Maui.Controls.resources.dll => 0x387cb42c56683b7b => 3
	i64 4073500526318903918, ; 64: System.Private.Xml.dll => 0x3887fb25779ae26e => 111
	i64 4073631083018132676, ; 65: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 48
	i64 4120493066591692148, ; 66: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 67: System.ComponentModel => 0x39a7562737acb67e => 94
	i64 4187479170553454871, ; 68: System.Linq.Expressions => 0x3a1cea1e912fa117 => 101
	i64 4205801962323029395, ; 69: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 93
	i64 4337444564132831293, ; 70: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 55
	i64 4360412976914417659, ; 71: tr\Microsoft.Maui.Controls.resources.dll => 0x3c834c8002fcc7fb => 28
	i64 4477672992252076438, ; 72: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 121
	i64 4794310189461587505, ; 73: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 59
	i64 4795410492532947900, ; 74: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 81
	i64 4871824391508510238, ; 75: nb\Microsoft.Maui.Controls.resources.dll => 0x439c3278d7f2c61e => 18
	i64 4953714692329509532, ; 76: sv\Microsoft.Maui.Controls.resources.dll => 0x44bf21444aef129c => 26
	i64 5423376490970181369, ; 77: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 112
	i64 5471532531798518949, ; 78: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522795224367697111, ; 79: MetroLog.Maui.dll => 0x4ca4e8fedba90cd7 => 38
	i64 5522859530602327440, ; 80: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 81: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 98
	i64 5573260873512690141, ; 82: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 115
	i64 5656829512427440287, ; 83: MetroLog.Maui => 0x4e8118786b2f089f => 38
	i64 5692067934154308417, ; 84: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 83
	i64 6183170893902868313, ; 85: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 55
	i64 6200764641006662125, ; 86: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 87: System.Text.Json.dll => 0x565a67a0ffe264a7 => 117
	i64 6300676701234028427, ; 88: es\Microsoft.Maui.Controls.resources.dll => 0x57708013cda25f8b => 6
	i64 6357457916754632952, ; 89: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 90: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 71
	i64 6471714727257221498, ; 91: fi\Microsoft.Maui.Controls.resources.dll => 0x59d026417dd4a97a => 7
	i64 6478287442656530074, ; 92: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6548213210057960872, ; 93: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 67
	i64 6560151584539558821, ; 94: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 46
	i64 6743165466166707109, ; 95: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6786606130239981554, ; 96: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 97
	i64 6863786117286185127, ; 97: MetroLog.Net6 => 0x5f41111b9719c8a7 => 39
	i64 6894844156784520562, ; 98: System.Numerics.Vectors => 0x5faf683aead1ad72 => 108
	i64 7102513984520274753, ; 99: MetroLog.Net6.dll => 0x629132d693934341 => 39
	i64 7270811800166795866, ; 100: System.Linq => 0x64e71ccf51a90a5a => 102
	i64 7377312882064240630, ; 101: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 93
	i64 7489048572193775167, ; 102: System.ObjectModel => 0x67ee71ff6b419e3f => 109
	i64 7637303409920963731, ; 103: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 99
	i64 7654504624184590948, ; 104: System.Net.Http => 0x6a3a4366801b8264 => 104
	i64 7694700312542370399, ; 105: System.Net.Mail => 0x6ac9112a7e2cda5f => 105
	i64 7714652370974252055, ; 106: System.Private.CoreLib => 0x6b0ff375198b9c17 => 125
	i64 7735352534559001595, ; 107: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 85
	i64 7742555799473854801, ; 108: it\Microsoft.Maui.Controls.resources.dll => 0x6b73157a51479951 => 14
	i64 7836164640616011524, ; 109: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 61
	i64 7975724199463739455, ; 110: sk\Microsoft.Maui.Controls.resources.dll => 0x6eaf76e6f785e03f => 25
	i64 8064050204834738623, ; 111: System.Collections.dll => 0x6fe942efa61731bf => 91
	i64 8083354569033831015, ; 112: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 70
	i64 8087206902342787202, ; 113: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 96
	i64 8108129031893776750, ; 114: ko\Microsoft.Maui.Controls.resources.dll => 0x7085dc65530f796e => 16
	i64 8167236081217502503, ; 115: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 126
	i64 8185542183669246576, ; 116: System.Collections => 0x7198e33f4794aa70 => 91
	i64 8246048515196606205, ; 117: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 53
	i64 8368701292315763008, ; 118: System.Security.Cryptography => 0x7423997c6fd56140 => 115
	i64 8386351099740279196, ; 119: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x74624de475b9d19c => 31
	i64 8400357532724379117, ; 120: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 78
	i64 8518412311883997971, ; 121: System.Collections.Immutable => 0x76377add7c28e313 => 89
	i64 8563666267364444763, ; 122: System.Private.Uri => 0x76d841191140ca5b => 110
	i64 8599632406834268464, ; 123: CommunityToolkit.Maui => 0x7758081c784b4930 => 35
	i64 8626175481042262068, ; 124: Java.Interop => 0x77b654e585b55834 => 126
	i64 8639588376636138208, ; 125: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 77
	i64 8677882282824630478, ; 126: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 127: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 96
	i64 9045785047181495996, ; 128: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9312692141327339315, ; 129: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 83
	i64 9324707631942237306, ; 130: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 60
	i64 9363564275759486853, ; 131: el\Microsoft.Maui.Controls.resources.dll => 0x81f21019382e9785 => 5
	i64 9551379474083066910, ; 132: uk\Microsoft.Maui.Controls.resources.dll => 0x848d5106bbadb41e => 29
	i64 9659729154652888475, ; 133: System.Text.RegularExpressions => 0x860e407c9991dd9b => 118
	i64 9678050649315576968, ; 134: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 64
	i64 9702891218465930390, ; 135: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 90
	i64 9773637193738963987, ; 136: ca\Microsoft.Maui.Controls.resources.dll => 0x87a2ef3ea85b4c13 => 1
	i64 9808709177481450983, ; 137: Mono.Android.dll => 0x881f890734e555e7 => 128
	i64 9956195530459977388, ; 138: Microsoft.Maui => 0x8a2b8315b36616ac => 51
	i64 10038780035334861115, ; 139: System.Net.Http.dll => 0x8b50e941206af13b => 104
	i64 10051358222726253779, ; 140: System.Private.Xml => 0x8b7d990c97ccccd3 => 111
	i64 10092835686693276772, ; 141: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 49
	i64 10143853363526200146, ; 142: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10209869394718195525, ; 143: nl\Microsoft.Maui.Controls.resources.dll => 0x8db0be1ecb4f7f45 => 19
	i64 10229024438826829339, ; 144: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 67
	i64 10406448008575299332, ; 145: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 86
	i64 10430153318873392755, ; 146: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 65
	i64 10506226065143327199, ; 147: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10761706286639228993, ; 148: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0x955942d988382841 => 33
	i64 10785150219063592792, ; 149: System.Net.Primitives => 0x95ac8cfb68830758 => 106
	i64 10880838204485145808, ; 150: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 35
	i64 11002576679268595294, ; 151: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 45
	i64 11009005086950030778, ; 152: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 51
	i64 11103970607964515343, ; 153: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11156122287428000958, ; 154: th\Microsoft.Maui.Controls.resources.dll => 0x9ad2821cdcf6dcbe => 27
	i64 11157797727133427779, ; 155: fr\Microsoft.Maui.Controls.resources.dll => 0x9ad875ea9172e843 => 8
	i64 11162124722117608902, ; 156: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 82
	i64 11220793807500858938, ; 157: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 158: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 46
	i64 11340910727871153756, ; 159: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 66
	i64 11485890710487134646, ; 160: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 113
	i64 11518296021396496455, ; 161: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 162: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 82
	i64 11530571088791430846, ; 163: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 44
	i64 11597940890313164233, ; 164: netstandard => 0xa0f429ca8d1805c9 => 124
	i64 11739066727115742305, ; 165: SQLite-net.dll => 0xa2e98afdf8575c61 => 54
	i64 11806260347154423189, ; 166: SQLite-net => 0xa3d8433bc5eb5d95 => 54
	i64 11855031688536399763, ; 167: vi\Microsoft.Maui.Controls.resources.dll => 0xa485888294361f93 => 30
	i64 12145679461940342714, ; 168: System.Text.Json => 0xa88e1f1ebcb62fba => 117
	i64 12269460666702402136, ; 169: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 89
	i64 12279246230491828964, ; 170: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 58
	i64 12341818387765915815, ; 171: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 36
	i64 12451044538927396471, ; 172: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 69
	i64 12466513435562512481, ; 173: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 74
	i64 12475113361194491050, ; 174: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12517810545449516888, ; 175: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 97
	i64 12538491095302438457, ; 176: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 62
	i64 12550732019250633519, ; 177: System.IO.Compression => 0xae2d28465e8e1b2f => 100
	i64 12669834014006836609, ; 178: EqInv => 0xafd44ae87809fd81 => 87
	i64 12700543734426720211, ; 179: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 63
	i64 12843321153144804894, ; 180: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 47
	i64 12989346753972519995, ; 181: ar\Microsoft.Maui.Controls.resources.dll => 0xb4436e0d5ee7c43b => 0
	i64 13005833372463390146, ; 182: pt-BR\Microsoft.Maui.Controls.resources.dll => 0xb47e008b5d99ddc2 => 21
	i64 13343850469010654401, ; 183: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 127
	i64 13381594904270902445, ; 184: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13465488254036897740, ; 185: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 85
	i64 13540124433173649601, ; 186: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13572454107664307259, ; 187: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 79
	i64 13717397318615465333, ; 188: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 92
	i64 13881769479078963060, ; 189: System.Console.dll => 0xc0a5f3cade5c6774 => 95
	i64 13959074834287824816, ; 190: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 69
	i64 14124974489674258913, ; 191: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 62
	i64 14125464355221830302, ; 192: System.Threading.dll => 0xc407bafdbc707a9e => 120
	i64 14349907877893689639, ; 193: ro\Microsoft.Maui.Controls.resources.dll => 0xc7251d2f956ed127 => 23
	i64 14461014870687870182, ; 194: System.Net.Requests.dll => 0xc8afd8683afdece6 => 107
	i64 14464374589798375073, ; 195: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14491877563792607819, ; 196: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0xc91d7ddcee4fca4b => 32
	i64 14551742072151931844, ; 197: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 116
	i64 14556034074661724008, ; 198: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 36
	i64 14610046442689856844, ; 199: cs\Microsoft.Maui.Controls.resources.dll => 0xcac14fd5107d054c => 2
	i64 14669215534098758659, ; 200: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 42
	i64 14690985099581930927, ; 201: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 121
	i64 14705122255218365489, ; 202: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14735017007120366644, ; 203: ja\Microsoft.Maui.Controls.resources.dll => 0xcc7d4be604bfbc34 => 15
	i64 14744092281598614090, ; 204: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14852515768018889994, ; 205: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 66
	i64 14904040806490515477, ; 206: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14954917835170835695, ; 207: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 43
	i64 14987728460634540364, ; 208: System.IO.Compression.dll => 0xcfff1ba06622494c => 100
	i64 15076659072870671916, ; 209: System.ObjectModel.dll => 0xd13b0d8c1620662c => 109
	i64 15111608613780139878, ; 210: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 211: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 98
	i64 15133485256822086103, ; 212: System.Linq.dll => 0xd204f0a9127dd9d7 => 102
	i64 15203009853192377507, ; 213: pt\Microsoft.Maui.Controls.resources.dll => 0xd2fbf0e9984b94a3 => 22
	i64 15227001540531775957, ; 214: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 41
	i64 15370334346939861994, ; 215: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 65
	i64 15391712275433856905, ; 216: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 43
	i64 15527772828719725935, ; 217: System.Console => 0xd77dbb1e38cd3d6f => 95
	i64 15536481058354060254, ; 218: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15582737692548360875, ; 219: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 73
	i64 15609085926864131306, ; 220: System.dll => 0xd89e9cf3334914ea => 123
	i64 15661133872274321916, ; 221: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 122
	i64 15783653065526199428, ; 222: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15928521404965645318, ; 223: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 48
	i64 16056281320585338352, ; 224: ru\Microsoft.Maui.Controls.resources.dll => 0xded35eca8f3a9df0 => 24
	i64 16154507427712707110, ; 225: System => 0xe03056ea4e39aa26 => 123
	i64 16288847719894691167, ; 226: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 227: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 45
	i64 16648892297579399389, ; 228: CommunityToolkit.Mvvm => 0xe70cbf55c4f508dd => 37
	i64 16649148416072044166, ; 229: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 53
	i64 16677317093839702854, ; 230: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 78
	i64 16709499819875633724, ; 231: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 99
	i64 16755018182064898362, ; 232: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 56
	i64 16803648858859583026, ; 233: ms\Microsoft.Maui.Controls.resources.dll => 0xe9328d9b8ab93632 => 17
	i64 16890310621557459193, ; 234: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 118
	i64 16942731696432749159, ; 235: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16998075588627545693, ; 236: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 76
	i64 17008137082415910100, ; 237: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 90
	i64 17031351772568316411, ; 238: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 75
	i64 17062143951396181894, ; 239: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 92
	i64 17203614576212522419, ; 240: pl\Microsoft.Maui.Controls.resources.dll => 0xeebf844ef3e135b3 => 20
	i64 17310278548634113468, ; 241: hi\Microsoft.Maui.Controls.resources.dll => 0xf03a76a04e6695bc => 10
	i64 17342750010158924305, ; 242: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17514990004910432069, ; 243: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17623389608345532001, ; 244: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17704177640604968747, ; 245: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 74
	i64 17710060891934109755, ; 246: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 72
	i64 17712670374920797664, ; 247: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 113
	i64 17827813215687577648, ; 248: hr\Microsoft.Maui.Controls.resources.dll => 0xf7691da9f3129030 => 11
	i64 17942426894774770628, ; 249: de\Microsoft.Maui.Controls.resources.dll => 0xf9004e329f771bc4 => 4
	i64 18025913125965088385, ; 250: System.Threading => 0xfa28e87b91334681 => 120
	i64 18121036031235206392, ; 251: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 75
	i64 18245806341561545090, ; 252: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 88
	i64 18305135509493619199, ; 253: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 77
	i64 18324163916253801303, ; 254: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
	i64 18342408478508122430, ; 255: id\Microsoft.Maui.Controls.resources.dll => 0xfe8d53543697013e => 13
	i64 18358161419737137786, ; 256: he\Microsoft.Maui.Controls.resources.dll => 0xfec54a8ba8b6827a => 9
	i64 18370042311372477656 ; 257: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 57
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [258 x i32] [
	i32 47, ; 0
	i32 128, ; 1
	i32 52, ; 2
	i32 101, ; 3
	i32 63, ; 4
	i32 80, ; 5
	i32 119, ; 6
	i32 94, ; 7
	i32 12, ; 8
	i32 57, ; 9
	i32 68, ; 10
	i32 84, ; 11
	i32 56, ; 12
	i32 76, ; 13
	i32 106, ; 14
	i32 49, ; 15
	i32 127, ; 16
	i32 58, ; 17
	i32 119, ; 18
	i32 61, ; 19
	i32 73, ; 20
	i32 105, ; 21
	i32 103, ; 22
	i32 110, ; 23
	i32 60, ; 24
	i32 112, ; 25
	i32 87, ; 26
	i32 6, ; 27
	i32 80, ; 28
	i32 28, ; 29
	i32 50, ; 30
	i32 37, ; 31
	i32 72, ; 32
	i32 68, ; 33
	i32 88, ; 34
	i32 71, ; 35
	i32 116, ; 36
	i32 64, ; 37
	i32 114, ; 38
	i32 59, ; 39
	i32 27, ; 40
	i32 42, ; 41
	i32 2, ; 42
	i32 7, ; 43
	i32 84, ; 44
	i32 70, ; 45
	i32 108, ; 46
	i32 86, ; 47
	i32 52, ; 48
	i32 40, ; 49
	i32 81, ; 50
	i32 125, ; 51
	i32 22, ; 52
	i32 114, ; 53
	i32 41, ; 54
	i32 122, ; 55
	i32 40, ; 56
	i32 124, ; 57
	i32 79, ; 58
	i32 44, ; 59
	i32 50, ; 60
	i32 107, ; 61
	i32 103, ; 62
	i32 3, ; 63
	i32 111, ; 64
	i32 48, ; 65
	i32 33, ; 66
	i32 94, ; 67
	i32 101, ; 68
	i32 93, ; 69
	i32 55, ; 70
	i32 28, ; 71
	i32 121, ; 72
	i32 59, ; 73
	i32 81, ; 74
	i32 18, ; 75
	i32 26, ; 76
	i32 112, ; 77
	i32 26, ; 78
	i32 38, ; 79
	i32 29, ; 80
	i32 98, ; 81
	i32 115, ; 82
	i32 38, ; 83
	i32 83, ; 84
	i32 55, ; 85
	i32 23, ; 86
	i32 117, ; 87
	i32 6, ; 88
	i32 34, ; 89
	i32 71, ; 90
	i32 7, ; 91
	i32 11, ; 92
	i32 67, ; 93
	i32 46, ; 94
	i32 19, ; 95
	i32 97, ; 96
	i32 39, ; 97
	i32 108, ; 98
	i32 39, ; 99
	i32 102, ; 100
	i32 93, ; 101
	i32 109, ; 102
	i32 99, ; 103
	i32 104, ; 104
	i32 105, ; 105
	i32 125, ; 106
	i32 85, ; 107
	i32 14, ; 108
	i32 61, ; 109
	i32 25, ; 110
	i32 91, ; 111
	i32 70, ; 112
	i32 96, ; 113
	i32 16, ; 114
	i32 126, ; 115
	i32 91, ; 116
	i32 53, ; 117
	i32 115, ; 118
	i32 31, ; 119
	i32 78, ; 120
	i32 89, ; 121
	i32 110, ; 122
	i32 35, ; 123
	i32 126, ; 124
	i32 77, ; 125
	i32 21, ; 126
	i32 96, ; 127
	i32 31, ; 128
	i32 83, ; 129
	i32 60, ; 130
	i32 5, ; 131
	i32 29, ; 132
	i32 118, ; 133
	i32 64, ; 134
	i32 90, ; 135
	i32 1, ; 136
	i32 128, ; 137
	i32 51, ; 138
	i32 104, ; 139
	i32 111, ; 140
	i32 49, ; 141
	i32 3, ; 142
	i32 19, ; 143
	i32 67, ; 144
	i32 86, ; 145
	i32 65, ; 146
	i32 1, ; 147
	i32 33, ; 148
	i32 106, ; 149
	i32 35, ; 150
	i32 45, ; 151
	i32 51, ; 152
	i32 12, ; 153
	i32 27, ; 154
	i32 8, ; 155
	i32 82, ; 156
	i32 15, ; 157
	i32 46, ; 158
	i32 66, ; 159
	i32 113, ; 160
	i32 13, ; 161
	i32 82, ; 162
	i32 44, ; 163
	i32 124, ; 164
	i32 54, ; 165
	i32 54, ; 166
	i32 30, ; 167
	i32 117, ; 168
	i32 89, ; 169
	i32 58, ; 170
	i32 36, ; 171
	i32 69, ; 172
	i32 74, ; 173
	i32 34, ; 174
	i32 97, ; 175
	i32 62, ; 176
	i32 100, ; 177
	i32 87, ; 178
	i32 63, ; 179
	i32 47, ; 180
	i32 0, ; 181
	i32 21, ; 182
	i32 127, ; 183
	i32 9, ; 184
	i32 85, ; 185
	i32 30, ; 186
	i32 79, ; 187
	i32 92, ; 188
	i32 95, ; 189
	i32 69, ; 190
	i32 62, ; 191
	i32 120, ; 192
	i32 23, ; 193
	i32 107, ; 194
	i32 24, ; 195
	i32 32, ; 196
	i32 116, ; 197
	i32 36, ; 198
	i32 2, ; 199
	i32 42, ; 200
	i32 121, ; 201
	i32 16, ; 202
	i32 15, ; 203
	i32 32, ; 204
	i32 66, ; 205
	i32 0, ; 206
	i32 43, ; 207
	i32 100, ; 208
	i32 109, ; 209
	i32 17, ; 210
	i32 98, ; 211
	i32 102, ; 212
	i32 22, ; 213
	i32 41, ; 214
	i32 65, ; 215
	i32 43, ; 216
	i32 95, ; 217
	i32 4, ; 218
	i32 73, ; 219
	i32 123, ; 220
	i32 122, ; 221
	i32 5, ; 222
	i32 48, ; 223
	i32 24, ; 224
	i32 123, ; 225
	i32 18, ; 226
	i32 45, ; 227
	i32 37, ; 228
	i32 53, ; 229
	i32 78, ; 230
	i32 99, ; 231
	i32 56, ; 232
	i32 17, ; 233
	i32 118, ; 234
	i32 25, ; 235
	i32 76, ; 236
	i32 90, ; 237
	i32 75, ; 238
	i32 92, ; 239
	i32 20, ; 240
	i32 10, ; 241
	i32 10, ; 242
	i32 8, ; 243
	i32 20, ; 244
	i32 74, ; 245
	i32 72, ; 246
	i32 113, ; 247
	i32 11, ; 248
	i32 4, ; 249
	i32 120, ; 250
	i32 75, ; 251
	i32 88, ; 252
	i32 77, ; 253
	i32 14, ; 254
	i32 13, ; 255
	i32 9, ; 256
	i32 57 ; 257
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
