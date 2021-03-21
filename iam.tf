
/* resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role = "${aws_iam_role.iam_for_lambda.name}"
  policy_arn = "${aws_iam_policy.lambda_logging.arn}"
  depends_on = [  ]
} */

resource "aws_iam_role" "iam_for_lambda1" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "test_lambda1" {
  filename      = "volume_snap.zip"
  function_name = "test"
  role          = aws_iam_role.iam_for_lambda1.arn
  handler       = "volume_snap.lambda_handler"                                    # handler = filename.function_name

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
 # source_code_hash = filebase64sha256("python.zip")    # if zip file is already available

  runtime = "python3.7"


  
  }