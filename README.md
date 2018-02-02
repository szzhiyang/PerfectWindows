

# PerfectWindows

## 助您打造心目中最完美的 Windows ！

## 功能
> 您可以依您的喜好启用或禁用功能。
### 1. 消灭 Windows 中的广告
* 还您一个清静的 Windows 。
### 2. 消灭令您厌烦的 Windows 功能
* 您可以**按需**禁用 Cortana、OneDrive、锁屏、Windows Defender 以及 **Windows 自动更新**。
* **禁用 Windows 自动更新并不影响您手动检查、下载和安装更新。**
### 3. 添加音视频播放控制键和计算器键
|按键|功能|
|:-|:-|
|<kbd>Page Up</kbd>|增大系统音量
|<kbd>Page Down</kbd>|减小系统音量（直到静音）
|<kbd>End</kbd>|下一个（跳转至结尾）
|<kbd>Home</kbd>|上一个（跳转至开头）
|<kbd>Scroll Lock</kbd>|启动 Windows 计算器
### 4. 让 Windows 自动根据电脑供电模式切换电源计划

|电源|电源计划|
|:-|:-|
|电池|节能
|外接|高性能
### 5. 使 Microsoft Edge 与 Internet Explorer 的书签保持一致
### 6. 加速 Windows
* 通过禁用 Superfetch、家庭组、程序兼容性助手服务、磁盘碎片整理计划任务和自动维护计划任务来加速 Windows。
### 7. 加固 Windows
* **Windows 唤醒后必须输入密码。**
* **增强 Windows Defender 的防护能力。**
  ###### 如果您能够充分利用以下安全措施，并时刻保持 Windows 和应用程序最新，您甚至可以不在 Windows 上运行任何防病毒软件！
* **禁用 SMB v1 协议以帮助您防范利用漏洞传播的勒索软件。**
* **禁止从 U 盘运行可执行文件以彻底防死 U 盘病毒。**
  * 如须运行 U 盘中的可执行文件，请充分确认其安全性后将其移动至本地磁盘运行。
  * 如须从虚拟光驱或移动硬盘运行可执行文件，请为其分配 `X:`、`Y:` 或 `Z:` 盘符。
* **防止您双击运行压缩包中的可执行文件。**
  * 如果您使用文件资源管理器或者 7-Zip 打开压缩包，则您已享受到该保护。
  * 如果您使用其他解压缩软件打开压缩包，则只需将解压缩的临时文件夹设置为 `C:\Checkpoint` 即可享受到该保护。
* **为本地磁盘创造禁运区域以帮助您审核源自互联网的可执行文件。**
  * 位于各盘根目录下的名为 `Checkpoint` 的文件夹（如 `C:\Checkpoint`、`D:\Checkpoint`、`E:\Checkpoint`等等）中的可执行文件都会被阻止。
  * 将各个浏览器和下载工具的下载路径设置为 `C:\Checkpoint`、`D:\Checkpoint`等即可防止您直接运行刚下载的可执行文件。这可以帮助您识破几乎所有的恶意攻击行为。

### 8. 找回 Windows 10 照片查看器
### 9. 让 Windows 10 的任务栏更透明
### 10. 添加鼠标自然滚动功能
* 就像 Mac 那样。
### 11. 防止电脑自动唤醒
### 12. 帮助您轻松自如地修改 hosts 文件
### 13. 在文件资源管理器中隐藏系统文件夹
* 眼不见，心不烦。
* 以下系统文件夹将不会显示在文件资源管理器中：
```
%systemroot%
%ProgramFiles%
%ProgramFiles(x86)%
%ProgramData%
%systemdrive%\Users
%systemdrive%\PerfLogs
%systemdrive%\Windows.old
%userprofile%\ntuser.dat
%userprofile%\ntuser.ini
%userprofile%\AppData
%LocalAppData%
%LocalAppData%\Packages
%AppData%
%userprofile%\AppData\LocalLow
```
* 如需访问被隐藏的系统文件夹，请使用环境变量或快捷方式。
## 软件截图
###### 图中设置仅是出于我个人的喜好，与软件的默认设置正好相反。
###### 【X】代表禁用；【O】代表启用。
###### 您只需双击批处理文件即可切换【X】和【O】以使设置贴合您的喜好。
![软件截图](https://github.com/szzhiyang/Pics/raw/master/PerfectWindows/demo.png)


## 使用方法
1. 点击绿色按钮，并选择 “Download Zip”。
2. 打开压缩包，将 PerfectWindows 文件夹拖到你易于访问的位置，比如桌面。
3. 将每一项的设置调整为适合你的选项，**其中【X】代表禁用，【O】代表启用。如需切换【X】与【O】，请双击对应的批处理文件，而不要自行重命名批处理文件。**
4. **确认您的设置无误后，以管理员身份运行【Logoff to be perfect】或者【Restart to be perfect】以使所有设置生效，您的电脑将自动注销或重启。**
5. 好了，您已经拥有了完美的 Windows。

## 请杯咖啡
#### 如果 PerfectWindows 可以解决你在使用 Windows 时的痛点，不妨请我喝杯咖啡，想必也是非常愉悦的事情。 :smile:

![支付](https://github.com/szzhiyang/Pics/raw/master/PerfectWindows/Pay.jpg)

## 中英文对照表
* 为了避免编码错误，我不得不以英文命名批处理文件。

|英文|中文|
|:-|:-|
|Restart to be perfect|重启以优化 Windows|
|Logoff to be perfect|注销以优化 Windows|
|Hosts Editor|Hosts 编辑器|
|Natural Scrolling|鼠标自然滚动|
|Power Keys|键盘增强|
|Smart Power Plan|智能电源选项|
|Sync between IE and Edge|使 Edge 与 IE 的书签保持一致|
|Windows Update|Windows 自动更新|

## 技术支持
#### 如果您在使用本工具后遇到了任何问题，请更新并重新运行本工具。
#### 如果问题仍然没有得到解决，请及时在知乎私聊我或者提交 issue，谢谢。
