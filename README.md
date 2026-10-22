# Eng Mohammed Fathy Survey  (AutoCAD 2015 - 2025)

أداة واحدة (DLL واحد) فيها الـ 12 أداة C# في تبويب ريبون واحد اسمه **Eng Mohammed Fathy Survey**.
كل مرة تدوس على التبويب تظهر رسالة الترحيب (من غير حد يومي).

## الأدوات / الأوامر
| الزرار | الأمر | الأداة |
|---|---|---|
| Traverse | MSTRAV | Traverse |
| Alignment | MFAL | Smart Alignment |
| Import points | MFIMP | Import points |
| Export points | MFEX | Export points |
| Table | MFTABLE | Table |
| Dynamic offset | MFOFF | Offset |
| Slab level | MFSL | Slab level |
| Stairs level | MFSTA | Stairs level |
| Ramp level | MFRAMP | Ramp level |
| Coordinates comparison | MFCO | Coordinates comparison |
| Compare level | MFCL (و MFLC) | Compare level |
| Drawing as-built | MFDRAWING | Drawing as-built |

أمر إضافي: `MFSURVEY` يفتح رسالة الترحيب بإيدك.

## البناء في Visual Studio
1. محتاج: Visual Studio 2022 + .NET Framework 4.8 targeting pack + .NET 8 SDK (لو عايز نسخة 2025).
2. افتح `EngMohammedFathySurvey.sln` واختار **Release** ثم Build > Build Solution.
3. مسارات AutoCAD (للمراجع بس) بتتلقط تلقائي من `Directory.Build.props`:
   - نسخة net48 بتتبني على **أقدم AutoCAD منزّل عندك (يفضّل 2015)** عشان تشتغل على 2015 لحد 2024.
   - نسخة net8 (AutoCAD 2025) بتتبني لو AutoCAD 2025 منزّل، وغير كده بتتخطى.
   - لو المسار مختلف: `Directory.Build.props` وغيّر `AcadLegacy` / `Acad2025`.
4. بعد كل Build الأداة بتتنسخ لوحدها في
   `%APPDATA%\Autodesk\ApplicationPlugins\EngMohammedFathySurvey.bundle`
   فتتحمّل تلقائي كل ما تفتح AutoCAD (اقفل AutoCAD قبل الـ Build).
5. من غير الـ bundle: `NETLOAD` ← `bin\Release\net48\EngMohammedFathySurvey.dll` (أو net8.0-windows لـ 2025).

## ملاحظات
- الريبون: `Ribbon\RibbonBuilder.cs` (الأسماء والأيقونات في `Assets\Icons`).
- رسالة الترحيب: `Welcome\WelcomeWindow.cs` + الصورة `Welcome\welcome.jpg`.
- كل أداة في مجلد جوه `Tools\` بنفس الـ namespace الأصلي.
- شرح كل أداة الأصلي في مجلد `Docs`.

## بدون Visual Studio
1. نزّل وثبّت ".NET 8 SDK" (مجاني) و ".NET Framework 4.8 Developer Pack".
2. اقفل AutoCAD ودوس مرتين على `Build.bat`.
3. افتح AutoCAD وادوس على تبويب Eng Mohammed Fathy Survey (أو اكتب `NETLOAD` واختار الـ DLL).
