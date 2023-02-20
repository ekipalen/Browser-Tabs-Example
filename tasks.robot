*** Settings ***
Documentation       Template robot main suite.
Library    RPA.Browser.Selenium

*** Tasks ***
Minimal task
    Open Available Browser     https://robocorp.com 
    Wait Until Element Is Visible    //a[contains(text(),'Gen2RPA')]
    # Get some text to be used in another tab
    ${variable}    Get Text    //a[contains(text(),'Gen2RPA')]
    # Login link will open second tab
    Click Element When Visible    //a[contains(text(),'Login')]   
    # switch to the new tab
    ${handle} =	Switch Window	NEW
    Go To    http://www.google.com
    Sleep   2
    # switch to the first tab
    ${handle} =	Switch Window	MAIN
    Sleep   2
    # Login link will open third tab
    Click Element When Visible    //a[contains(text(),'Login')]    
    Sleep   2
    # get handles from all tabs
    ${window_handles}     Get Window Handles
    FOR    ${handle}    IN    @{window_handles}
        Log To Console    ${handle}
    END
    # use handle to switch window
    Switch Window   ${window_handles}[0]
    Sleep   2 
    Switch Window   ${window_handles}[1]
    Sleep   2 
    Switch Window   ${window_handles}[2]
    Sleep   2 
    
    # get window titles
    ${titles}   Get Window Titles    
    FOR    ${title}    IN    @{titles}
        Log To Console    ${title}
    END
    # use title to switch windows
    Switch Window   locator=title:Google
    Sleep   2
    Switch Window   locator=title:${titles}[0]
    Sleep   2
    Switch Window   locator=title:${titles}[1]
    Sleep   2
    Switch Window   locator=title:${titles}[2]
    Sleep   2