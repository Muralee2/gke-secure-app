PROJECT_ID="modern-girder-463514-t1"
SA_EMAIL="terraform-deployer@$PROJECT_ID.iam.gserviceaccount.com"

gcloud iam service-accounts keys create ~/terraform-sa-key.json \
  --iam-account=$SA_EMAIL

