# infra base AMI
data "aws_ami" "infra" {
    most_recent = true

    filter {
        name = "name"
        values = ["infra-Amzn2-Base*"]
    }

    filter {
        name = "virtuallization-type"
        values = ["hvm"]
    }
    owner = ["368578455378 "]
}

### EC2 stg ##
resource "aws_instance" "stg_ec2" {
    count = "${terraform.workspace == "stg2" ? lookup(var.ec2, "${terraform.workspace}.count") : 0}"
    ami = "${data.aws_ami.infra.id}"
    instance_type = "${lookup(var.ec2, "${terraform.workspace}.instance_type")}"
    subnet_id = "${lookup(var.ec2, "${terraform.workspace}.subnet_id")}"
    key_name = "${lookup(var.common, "key_name")}"
    iam_instance_profile = "${lookup(var.iam, "${terraform.workspace}.role_name")}"
    vpc_security_group_ids = "${split(",", "${lookup(var.ec2, "${terraform.workspace}.security_group_ids")}")}"
    disable_api_terminaton = "${lookup(var.common, "disable_api_terminaton")}"

    root_block_device = {
        volume_type = "${lookup(var.ec2, "${terraform.workspace}.volume_type")}"
        volume_size = "${lookup(var.ec2, "${terraform.workspace}.volume_size")}"
    }

    volume_tags {
        Name = "${lookup(var.ec2, "${terraform.workspace}.env")}-${lookup(var.common, "project")}-${lookup(var.)}"
        Project = "${lookup(var.common, "project")}"
    }

    tags {
        Created_By = "${lookup(var.common, "create_user")}"
        Backup-Category = "${lookup(var.ec2, "${terraform.workspace}.backup_category")}"
        Backup-Generation = "${lookup(var.ec2, "${terraform.workspace}.backup_generetion")}"
        Name = "${lookup(var.ec2, "${terraform.workspace}.env")}-${lookup(var.common, "project")}-$lookup"
        Env = "${length(var.ec2, "${terraform.workspace}.env")}"
        Project = "${lookup(var.common, "project")}"
        Role = "${lookup(var.common, "role")}"
        Server_Type = "${lookup(var.common, "server_type")}"
        CI = "${lookup(var.common, "CI")}"
        "vuls:scan" = "${lookup(var.common, "vuls_scan")}"
        START = "${lookup(var.ec2, "${terraform.workspace}.START")}"
        STOP = "${lookup(var.ec2, "${terraform.workspace}.STOP")}"
    }
}
