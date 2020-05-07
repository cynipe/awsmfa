# awsmfa

awsmfa util script for cli

## Prerequisites

- aws cli
- place your aws config as following:

    ~/.aws/credentials
    ```
    [refresh-awsmfa-token]
    aws_access_key_id = ***********
    aws_secret_access_key = **********************
    ```

## Install

```
$ make install AWS_ACCOUNT_ID=123456789012
```

### Want to change the IAM_USER instead of whoami?
```
$ make install AWS_ACCOUNT_ID=123456789012 AWS_IAM_USER=your-iam-user
```

### Want to change the install dir?
```
$ make install AWS_ACCOUNT_ID=123456789012  BINDIR=~/.local/bin
```

## Usage

```
$ awsmfa
MFA Token: 123456

~/.aws/credentials updated
```

### Want to change DURATION_SEC to 3600 instead of 1800?
```
$ awsmfa 3600
MFA Token: 123456

~/.aws/credentials updated
```

## For more?

```
cat Makefile
```
