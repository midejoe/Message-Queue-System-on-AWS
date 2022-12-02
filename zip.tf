data "archive_file" "zip_the_nodejs_code" {
    type = "zip"
    source_dir = "${path.module}/application-backend/"
    output_path = "${path.module}/application-backend/index.zip"
}

data "archive_file" "zip_the_nodejs_code1" {
    type = "zip"
    source_dir = "${path.module}/bookstore-1/"
    output_path = "${path.module}/bookstore-1/index.zip"
}

data "archive_file" "zip_the_nodejs_code2" {
    type = "zip"
    source_dir = "${path.module}/bookstore-2/"
    output_path = "${path.module}/bookstore-2/index.zip"
}

data "archive_file" "zip_the_nodejs_code3" {
    type = "zip"
    source_dir = "${path.module}/bookstore-3/"
    output_path = "${path.module}/bookstore-3/index.zip"
}

