; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [129 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [258 x i32] [
	i32 38948123, ; 0: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 0
	i32 42244203, ; 1: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 9
	i32 42639949, ; 2: System.Threading.Thread => 0x28aa24d => 119
	i32 67008169, ; 3: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 4: Microsoft.Maui.Graphics.dll => 0x44bb714 => 53
	i32 83839681, ; 5: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 17
	i32 115713944, ; 6: MetroLog.Net6 => 0x6e5a798 => 39
	i32 117431740, ; 7: System.Runtime.InteropServices => 0x6ffddbc => 113
	i32 136584136, ; 8: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 32
	i32 140062828, ; 9: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 25
	i32 165246403, ; 10: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 63
	i32 182336117, ; 11: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 81
	i32 205061960, ; 12: System.ComponentModel => 0xc38ff48 => 94
	i32 317674968, ; 13: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 14: Xamarin.AndroidX.Activity.dll => 0x13031348 => 59
	i32 321963286, ; 15: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 8
	i32 342366114, ; 16: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 70
	i32 347068432, ; 17: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 57
	i32 379916513, ; 18: System.Threading.Thread.dll => 0x16a510e1 => 119
	i32 385762202, ; 19: System.Memory.dll => 0x16fe439a => 103
	i32 395744057, ; 20: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 409257351, ; 21: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 28
	i32 442565967, ; 22: System.Collections => 0x1a61054f => 91
	i32 450948140, ; 23: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 69
	i32 456227837, ; 24: System.Web.HttpUtility.dll => 0x1b317bfd => 121
	i32 469710990, ; 25: System.dll => 0x1bff388e => 123
	i32 489220957, ; 26: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 6
	i32 498788369, ; 27: System.ObjectModel => 0x1dbae811 => 109
	i32 513247710, ; 28: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 47
	i32 538707440, ; 29: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 27
	i32 539058512, ; 30: Microsoft.Extensions.Logging => 0x20216150 => 44
	i32 597488923, ; 31: CommunityToolkit.Maui => 0x239cf51b => 35
	i32 627609679, ; 32: Xamarin.AndroidX.CustomView => 0x2568904f => 67
	i32 627931235, ; 33: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 34: System.Text.Encodings.Web.dll => 0x27787397 => 116
	i32 672442732, ; 35: System.Collections.Concurrent => 0x2814a96c => 88
	i32 700358131, ; 36: System.IO.Compression.ZipFile => 0x29be9df3 => 99
	i32 748832960, ; 37: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 55
	i32 759454413, ; 38: System.Net.Requests => 0x2d445acd => 107
	i32 775507847, ; 39: System.IO.Compression => 0x2e394f87 => 100
	i32 777317022, ; 40: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 41: Microsoft.Extensions.Options => 0x2f0980eb => 46
	i32 815124059, ; 42: MetroLog.Maui => 0x3095ce5b => 38
	i32 823281589, ; 43: System.Private.Uri.dll => 0x311247b5 => 110
	i32 830298997, ; 44: System.IO.Compression.Brotli => 0x317d5b75 => 98
	i32 845654498, ; 45: MetroLog.Net6.dll => 0x3267a9e2 => 39
	i32 869139383, ; 46: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 10
	i32 880668424, ; 47: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 24
	i32 904024072, ; 48: System.ComponentModel.Primitives.dll => 0x35e25008 => 92
	i32 918734561, ; 49: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 21
	i32 961460050, ; 50: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 14
	i32 967690846, ; 51: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 70
	i32 990727110, ; 52: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 23
	i32 992768348, ; 53: System.Collections.dll => 0x3b2c715c => 91
	i32 1012816738, ; 54: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 80
	i32 1028951442, ; 55: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 43
	i32 1035644815, ; 56: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 60
	i32 1043950537, ; 57: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 4
	i32 1044663988, ; 58: System.Linq.Expressions.dll => 0x3e444eb4 => 101
	i32 1052210849, ; 59: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 72
	i32 1082857460, ; 60: System.ComponentModel.TypeConverter => 0x408b17f4 => 93
	i32 1084122840, ; 61: Xamarin.Kotlin.StdLib => 0x409e66d8 => 85
	i32 1098259244, ; 62: System => 0x41761b2c => 123
	i32 1108272742, ; 63: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 26
	i32 1117529484, ; 64: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 20
	i32 1118262833, ; 65: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 66: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 67: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 77
	i32 1214827643, ; 68: CommunityToolkit.Mvvm => 0x4868cc7b => 37
	i32 1260983243, ; 69: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1292207520, ; 70: SQLitePCLRaw.core.dll => 0x4d0585a0 => 56
	i32 1293217323, ; 71: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 68
	i32 1308624726, ; 72: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 11
	i32 1324164729, ; 73: System.Linq => 0x4eed2679 => 102
	i32 1336711579, ; 74: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 31
	i32 1373134921, ; 75: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 76: Xamarin.AndroidX.SavedState => 0x52114ed3 => 80
	i32 1406073936, ; 77: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 64
	i32 1430672901, ; 78: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 79: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 80: System.Collections.Immutable.dll => 0x5718a9ef => 89
	i32 1462112819, ; 81: System.IO.Compression.dll => 0x57261233 => 100
	i32 1469204771, ; 82: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 61
	i32 1470490898, ; 83: Microsoft.Extensions.Primitives => 0x57a5e912 => 47
	i32 1479771757, ; 84: System.Collections.Immutable => 0x5833866d => 89
	i32 1480492111, ; 85: System.IO.Compression.Brotli.dll => 0x583e844f => 98
	i32 1526286932, ; 86: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 30
	i32 1543031311, ; 87: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 118
	i32 1622152042, ; 88: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 74
	i32 1624863272, ; 89: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 83
	i32 1634654947, ; 90: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 36
	i32 1636350590, ; 91: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 66
	i32 1639515021, ; 92: System.Net.Http.dll => 0x61b9038d => 104
	i32 1639986890, ; 93: System.Text.RegularExpressions => 0x61c036ca => 118
	i32 1657153582, ; 94: System.Runtime => 0x62c6282e => 114
	i32 1658251792, ; 95: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 84
	i32 1677501392, ; 96: System.Net.Primitives.dll => 0x63fca3d0 => 106
	i32 1679769178, ; 97: System.Security.Cryptography => 0x641f3e5a => 115
	i32 1711441057, ; 98: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 57
	i32 1717873173, ; 99: MetroLog.Maui.dll => 0x6664aa15 => 38
	i32 1729485958, ; 100: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 62
	i32 1743415430, ; 101: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 102: System.Diagnostics.TraceSource.dll => 0x69239124 => 97
	i32 1766324549, ; 103: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 81
	i32 1770582343, ; 104: Microsoft.Extensions.Logging.dll => 0x6988f147 => 44
	i32 1780572499, ; 105: Mono.Android.Runtime.dll => 0x6a216153 => 127
	i32 1782862114, ; 106: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 107: Xamarin.AndroidX.Fragment => 0x6a96652d => 69
	i32 1793755602, ; 108: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 109: Xamarin.AndroidX.Loader => 0x6bcd3296 => 74
	i32 1813058853, ; 110: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 85
	i32 1813201214, ; 111: Xamarin.Google.Android.Material => 0x6c13413e => 84
	i32 1818569960, ; 112: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 78
	i32 1828688058, ; 113: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 45
	i32 1853025655, ; 114: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 115: System.Linq.Expressions => 0x6ec71a65 => 101
	i32 1875935024, ; 116: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1893218855, ; 117: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 2
	i32 1910275211, ; 118: System.Collections.NonGeneric.dll => 0x71dc7c8b => 90
	i32 1953182387, ; 119: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 13
	i32 1968388702, ; 120: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 40
	i32 2003115576, ; 121: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 122: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 72
	i32 2045470958, ; 123: System.Private.Xml => 0x79eb68ee => 111
	i32 2055257422, ; 124: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 71
	i32 2066184531, ; 125: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 126: System.Diagnostics.TraceSource => 0x7b6f419e => 97
	i32 2079903147, ; 127: System.Runtime.dll => 0x7bf8cdab => 114
	i32 2090596640, ; 128: System.Numerics.Vectors => 0x7c9bf920 => 108
	i32 2103459038, ; 129: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 58
	i32 2127167465, ; 130: System.Console => 0x7ec9ffe9 => 95
	i32 2159891885, ; 131: Microsoft.Maui => 0x80bd55ad => 51
	i32 2169148018, ; 132: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 133: Microsoft.Extensions.Options.dll => 0x820d22b3 => 46
	i32 2192057212, ; 134: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 45
	i32 2193016926, ; 135: System.ObjectModel.dll => 0x82b6c85e => 109
	i32 2201107256, ; 136: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 86
	i32 2201231467, ; 137: System.Net.Http => 0x8334206b => 104
	i32 2207618523, ; 138: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 139: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 41
	i32 2279755925, ; 140: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 79
	i32 2298471582, ; 141: System.Net.Mail => 0x88ffe49e => 105
	i32 2303942373, ; 142: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 143: System.Private.CoreLib.dll => 0x896b7878 => 125
	i32 2340441535, ; 144: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 112
	i32 2353062107, ; 145: System.Net.Primitives => 0x8c40e0db => 106
	i32 2366048013, ; 146: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 12
	i32 2368005991, ; 147: System.Xml.ReaderWriter.dll => 0x8d24e767 => 122
	i32 2371007202, ; 148: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 40
	i32 2395872292, ; 149: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 150: System.Web.HttpUtility => 0x8f24faee => 121
	i32 2427813419, ; 151: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 152: System.Console.dll => 0x912896e5 => 95
	i32 2465273461, ; 153: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 55
	i32 2471841756, ; 154: netstandard.dll => 0x93554fdc => 124
	i32 2475788418, ; 155: Java.Interop.dll => 0x93918882 => 126
	i32 2480646305, ; 156: Microsoft.Maui.Controls => 0x93dba8a1 => 49
	i32 2503351294, ; 157: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 16
	i32 2550873716, ; 158: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2570120770, ; 159: System.Text.Encodings.Web => 0x9930ee42 => 116
	i32 2576534780, ; 160: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 15
	i32 2593496499, ; 161: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 162: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 86
	i32 2617129537, ; 163: System.Private.Xml.dll => 0x9bfe3a41 => 111
	i32 2620871830, ; 164: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 66
	i32 2626831493, ; 165: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2629843544, ; 166: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 99
	i32 2732626843, ; 167: Xamarin.AndroidX.Activity => 0xa2e0939b => 59
	i32 2737747696, ; 168: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 61
	i32 2740698338, ; 169: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 1
	i32 2752995522, ; 170: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 171: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 50
	i32 2764765095, ; 172: Microsoft.Maui.dll => 0xa4caf7a7 => 51
	i32 2778768386, ; 173: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 82
	i32 2785988530, ; 174: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 175: Microsoft.Maui.Graphics => 0xa7008e0b => 53
	i32 2810250172, ; 176: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 64
	i32 2820647746, ; 177: EqInv => 0xa81fab42 => 87
	i32 2853208004, ; 178: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 82
	i32 2861189240, ; 179: Microsoft.Maui.Essentials => 0xaa8a4878 => 52
	i32 2868488919, ; 180: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 36
	i32 2909740682, ; 181: System.Private.CoreLib => 0xad6f1e8a => 125
	i32 2916838712, ; 182: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 83
	i32 2919462931, ; 183: System.Numerics.Vectors.dll => 0xae037813 => 108
	i32 2959614098, ; 184: System.ComponentModel.dll => 0xb0682092 => 94
	i32 2978675010, ; 185: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 68
	i32 2980852617, ; 186: EqInv.dll => 0xb1ac3389 => 87
	i32 3038032645, ; 187: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3053864966, ; 188: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 7
	i32 3057625584, ; 189: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 75
	i32 3059408633, ; 190: Mono.Android.Runtime => 0xb65adef9 => 127
	i32 3059793426, ; 191: System.ComponentModel.Primitives => 0xb660be12 => 92
	i32 3178803400, ; 192: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 76
	i32 3220365878, ; 193: System.Threading => 0xbff2e236 => 120
	i32 3258312781, ; 194: Xamarin.AndroidX.CardView => 0xc235e84d => 62
	i32 3286872994, ; 195: SQLite-net.dll => 0xc3e9b3a2 => 54
	i32 3305363605, ; 196: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 197: System.Net.Requests.dll => 0xc5b097e4 => 107
	i32 3317135071, ; 198: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 67
	i32 3346324047, ; 199: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 77
	i32 3357674450, ; 200: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 201: System.Text.Json => 0xc82afec1 => 117
	i32 3360279109, ; 202: SQLitePCLRaw.core => 0xc849ca45 => 56
	i32 3362522851, ; 203: Xamarin.AndroidX.Core => 0xc86c06e3 => 65
	i32 3366347497, ; 204: Java.Interop => 0xc8a662e9 => 126
	i32 3374999561, ; 205: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 79
	i32 3381016424, ; 206: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 207: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 42
	i32 3430777524, ; 208: netstandard => 0xcc7d82b4 => 124
	i32 3452344032, ; 209: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 48
	i32 3458724246, ; 210: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 22
	i32 3471940407, ; 211: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 93
	i32 3476120550, ; 212: Mono.Android => 0xcf3163e6 => 128
	i32 3484440000, ; 213: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 214: System.Text.Json.dll => 0xcfbaacae => 117
	i32 3580758918, ; 215: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3592228221, ; 216: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 33
	i32 3608519521, ; 217: System.Linq.dll => 0xd715a361 => 102
	i32 3624195450, ; 218: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 112
	i32 3641597786, ; 219: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 71
	i32 3643446276, ; 220: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 221: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 76
	i32 3657292374, ; 222: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 41
	i32 3672681054, ; 223: Mono.Android.dll => 0xdae8aa5e => 128
	i32 3724971120, ; 224: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 75
	i32 3748608112, ; 225: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 96
	i32 3751619990, ; 226: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 3
	i32 3754567612, ; 227: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 58
	i32 3786282454, ; 228: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 63
	i32 3792276235, ; 229: System.Collections.NonGeneric => 0xe2098b0b => 90
	i32 3800979733, ; 230: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 48
	i32 3817368567, ; 231: CommunityToolkit.Maui.dll => 0xe3886bf7 => 35
	i32 3823082795, ; 232: System.Security.Cryptography.dll => 0xe3df9d2b => 115
	i32 3841636137, ; 233: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 43
	i32 3844307129, ; 234: System.Net.Mail.dll => 0xe52378b9 => 105
	i32 3849253459, ; 235: System.Runtime.InteropServices.dll => 0xe56ef253 => 113
	i32 3876362041, ; 236: SQLite-net => 0xe70c9739 => 54
	i32 3896106733, ; 237: System.Collections.Concurrent.dll => 0xe839deed => 88
	i32 3896760992, ; 238: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 65
	i32 3920221145, ; 239: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 19
	i32 3928044579, ; 240: System.Xml.ReaderWriter => 0xea213423 => 122
	i32 3931092270, ; 241: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 78
	i32 3955647286, ; 242: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 60
	i32 4025784931, ; 243: System.Memory => 0xeff49a63 => 103
	i32 4046471985, ; 244: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 50
	i32 4073602200, ; 245: System.Threading.dll => 0xf2ce3c98 => 120
	i32 4091086043, ; 246: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 5
	i32 4094352644, ; 247: Microsoft.Maui.Essentials.dll => 0xf40add04 => 52
	i32 4100113165, ; 248: System.Private.Uri => 0xf462c30d => 110
	i32 4103439459, ; 249: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 29
	i32 4126470640, ; 250: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 42
	i32 4150914736, ; 251: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4182413190, ; 252: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 73
	i32 4213026141, ; 253: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 96
	i32 4249188766, ; 254: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 18
	i32 4271975918, ; 255: Microsoft.Maui.Controls.dll => 0xfea12dee => 49
	i32 4274623895, ; 256: CommunityToolkit.Mvvm.dll => 0xfec99597 => 37
	i32 4292120959 ; 257: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 73
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [258 x i32] [
	i32 0, ; 0
	i32 9, ; 1
	i32 119, ; 2
	i32 33, ; 3
	i32 53, ; 4
	i32 17, ; 5
	i32 39, ; 6
	i32 113, ; 7
	i32 32, ; 8
	i32 25, ; 9
	i32 63, ; 10
	i32 81, ; 11
	i32 94, ; 12
	i32 30, ; 13
	i32 59, ; 14
	i32 8, ; 15
	i32 70, ; 16
	i32 57, ; 17
	i32 119, ; 18
	i32 103, ; 19
	i32 34, ; 20
	i32 28, ; 21
	i32 91, ; 22
	i32 69, ; 23
	i32 121, ; 24
	i32 123, ; 25
	i32 6, ; 26
	i32 109, ; 27
	i32 47, ; 28
	i32 27, ; 29
	i32 44, ; 30
	i32 35, ; 31
	i32 67, ; 32
	i32 19, ; 33
	i32 116, ; 34
	i32 88, ; 35
	i32 99, ; 36
	i32 55, ; 37
	i32 107, ; 38
	i32 100, ; 39
	i32 25, ; 40
	i32 46, ; 41
	i32 38, ; 42
	i32 110, ; 43
	i32 98, ; 44
	i32 39, ; 45
	i32 10, ; 46
	i32 24, ; 47
	i32 92, ; 48
	i32 21, ; 49
	i32 14, ; 50
	i32 70, ; 51
	i32 23, ; 52
	i32 91, ; 53
	i32 80, ; 54
	i32 43, ; 55
	i32 60, ; 56
	i32 4, ; 57
	i32 101, ; 58
	i32 72, ; 59
	i32 93, ; 60
	i32 85, ; 61
	i32 123, ; 62
	i32 26, ; 63
	i32 20, ; 64
	i32 16, ; 65
	i32 22, ; 66
	i32 77, ; 67
	i32 37, ; 68
	i32 2, ; 69
	i32 56, ; 70
	i32 68, ; 71
	i32 11, ; 72
	i32 102, ; 73
	i32 31, ; 74
	i32 32, ; 75
	i32 80, ; 76
	i32 64, ; 77
	i32 0, ; 78
	i32 6, ; 79
	i32 89, ; 80
	i32 100, ; 81
	i32 61, ; 82
	i32 47, ; 83
	i32 89, ; 84
	i32 98, ; 85
	i32 30, ; 86
	i32 118, ; 87
	i32 74, ; 88
	i32 83, ; 89
	i32 36, ; 90
	i32 66, ; 91
	i32 104, ; 92
	i32 118, ; 93
	i32 114, ; 94
	i32 84, ; 95
	i32 106, ; 96
	i32 115, ; 97
	i32 57, ; 98
	i32 38, ; 99
	i32 62, ; 100
	i32 1, ; 101
	i32 97, ; 102
	i32 81, ; 103
	i32 44, ; 104
	i32 127, ; 105
	i32 17, ; 106
	i32 69, ; 107
	i32 9, ; 108
	i32 74, ; 109
	i32 85, ; 110
	i32 84, ; 111
	i32 78, ; 112
	i32 45, ; 113
	i32 26, ; 114
	i32 101, ; 115
	i32 8, ; 116
	i32 2, ; 117
	i32 90, ; 118
	i32 13, ; 119
	i32 40, ; 120
	i32 5, ; 121
	i32 72, ; 122
	i32 111, ; 123
	i32 71, ; 124
	i32 4, ; 125
	i32 97, ; 126
	i32 114, ; 127
	i32 108, ; 128
	i32 58, ; 129
	i32 95, ; 130
	i32 51, ; 131
	i32 12, ; 132
	i32 46, ; 133
	i32 45, ; 134
	i32 109, ; 135
	i32 86, ; 136
	i32 104, ; 137
	i32 14, ; 138
	i32 41, ; 139
	i32 79, ; 140
	i32 105, ; 141
	i32 18, ; 142
	i32 125, ; 143
	i32 112, ; 144
	i32 106, ; 145
	i32 12, ; 146
	i32 122, ; 147
	i32 40, ; 148
	i32 13, ; 149
	i32 121, ; 150
	i32 10, ; 151
	i32 95, ; 152
	i32 55, ; 153
	i32 124, ; 154
	i32 126, ; 155
	i32 49, ; 156
	i32 16, ; 157
	i32 11, ; 158
	i32 116, ; 159
	i32 15, ; 160
	i32 20, ; 161
	i32 86, ; 162
	i32 111, ; 163
	i32 66, ; 164
	i32 15, ; 165
	i32 99, ; 166
	i32 59, ; 167
	i32 61, ; 168
	i32 1, ; 169
	i32 21, ; 170
	i32 50, ; 171
	i32 51, ; 172
	i32 82, ; 173
	i32 27, ; 174
	i32 53, ; 175
	i32 64, ; 176
	i32 87, ; 177
	i32 82, ; 178
	i32 52, ; 179
	i32 36, ; 180
	i32 125, ; 181
	i32 83, ; 182
	i32 108, ; 183
	i32 94, ; 184
	i32 68, ; 185
	i32 87, ; 186
	i32 34, ; 187
	i32 7, ; 188
	i32 75, ; 189
	i32 127, ; 190
	i32 92, ; 191
	i32 76, ; 192
	i32 120, ; 193
	i32 62, ; 194
	i32 54, ; 195
	i32 7, ; 196
	i32 107, ; 197
	i32 67, ; 198
	i32 77, ; 199
	i32 24, ; 200
	i32 117, ; 201
	i32 56, ; 202
	i32 65, ; 203
	i32 126, ; 204
	i32 79, ; 205
	i32 3, ; 206
	i32 42, ; 207
	i32 124, ; 208
	i32 48, ; 209
	i32 22, ; 210
	i32 93, ; 211
	i32 128, ; 212
	i32 23, ; 213
	i32 117, ; 214
	i32 31, ; 215
	i32 33, ; 216
	i32 102, ; 217
	i32 112, ; 218
	i32 71, ; 219
	i32 28, ; 220
	i32 76, ; 221
	i32 41, ; 222
	i32 128, ; 223
	i32 75, ; 224
	i32 96, ; 225
	i32 3, ; 226
	i32 58, ; 227
	i32 63, ; 228
	i32 90, ; 229
	i32 48, ; 230
	i32 35, ; 231
	i32 115, ; 232
	i32 43, ; 233
	i32 105, ; 234
	i32 113, ; 235
	i32 54, ; 236
	i32 88, ; 237
	i32 65, ; 238
	i32 19, ; 239
	i32 122, ; 240
	i32 78, ; 241
	i32 60, ; 242
	i32 103, ; 243
	i32 50, ; 244
	i32 120, ; 245
	i32 5, ; 246
	i32 52, ; 247
	i32 110, ; 248
	i32 29, ; 249
	i32 42, ; 250
	i32 29, ; 251
	i32 73, ; 252
	i32 96, ; 253
	i32 18, ; 254
	i32 49, ; 255
	i32 37, ; 256
	i32 73 ; 257
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

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
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
