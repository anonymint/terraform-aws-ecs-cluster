data "aws_iam_policy_document" "this" {
  statement {
    actions = "${var.actions}"

    principals {
      type        = "Service"
      identifiers = "${var.ideantifiers}"
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "this" {
  name               = "${var.role_name}"
  assume_role_policy = "${data.aws_iam_policy_document.this.json}"
}

resource "aws_iam_role_policy_attachment" "attachment" {
  count      = "${length(var.policy_arns)}"
  role       = "${aws_iam_role.this.name}"
  policy_arn = "${var.policy_arns[count.index]}"
}

resource "aws_iam_instance_profile" "instance_profile" {
  count = "${var.create_instance_role}"
  name  = "${aws_iam_role.this.name}"
  role  = "${aws_iam_role.this.name}"
}
