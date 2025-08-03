PROJECT_ID="modern-girder-463514-t1"
SA_EMAIL="terraform-deployer@$PROJECT_ID.iam.gserviceaccount.com"

# Assign roles
for role in \
  roles/compute.admin \
  roles/container.admin \
  roles/iam.serviceAccountUser \
  roles/dns.admin \
  roles/viewer
do
  gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SA_EMAIL" \
    --role="$role"
done

