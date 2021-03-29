*** Settings ***
Suite Setup       openApp
Library           AppiumLibrary
Resource          系统关键字.txt
Resource          登录页面元素.txt
Resource          我的页面元素.txt

*** Test Cases ***
loginSuccess
    click    com.eviwjapp_cn:id/rb_me    #点击-我的
    click    ${LNK_LOGINNAME}    #点击-登录
    setValue    ${TXT_USERNAME}    18550159726    #输入用户名
    setPassWord    ${TXT_PASSWORD}    wtt333    #输入密码
    click    ${BTN_LOGIN}    #点击-立即登录
    ${isEventImg}    Run Keyword And Return Status    Wait Until Page Contains Element    ${IMG_EVENT}
    Run Keyword If    ${isEventImg}    click    ${IMG_EVENT}
    ${isLoginErrImg}    Run Keyword And Return Status    Wait Until Page Contains Element    ${IMG_ERROR}
    Run Keyword If    ${isLoginErrImg}    click    ${IMG_ERROR}
    click    ${BTN_README}    #点击-我的
    ${loginName}    getValue    ${LNK_LOGINNAME}
    Should Be Equal As Strings    ${loginName}    吴婷婷

logout
    click    ${BTN_README}    #点击-我的
    click    ${LNK_SETTING}    #点击系统设置
    click    ${BTN_LOGOUT}    #点击退出登录
    click    ${BTN_README}    #点击-我的
    ${loginName}    getValue    ${LNK_LOGINNAME}
    Should Be Equal As Strings    ${loginName}    请登录
