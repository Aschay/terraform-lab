terraform {
    //create storage for remote states
  backend "s3" {
    bucket = "remote-states-91" #name+id
    key    = "dev/remote_state"
    region = "us-east-2"
  }
}