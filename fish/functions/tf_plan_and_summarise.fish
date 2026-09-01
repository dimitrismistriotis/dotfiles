function tf_plan_and_summarise
  tofu plan -out=tfplan.bin && tofu show -json tfplan.bin | tf-summarize; rm -f tfplan.bin
end
