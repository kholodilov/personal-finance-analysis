library('RUnit')

test.suite <- defineTestSuite("personal-finance-analysis",
                              dirs = file.path("tests"),
                              testFileRegexp = '^.+\\.R$')

test.result <- runTestSuite(test.suite)

printTextProtocol(test.result)
