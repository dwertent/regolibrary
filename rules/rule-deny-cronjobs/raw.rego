package armo_builtins

# alert cronjobs

#handles cronjob
deny[msga] {

	wl := input[_]
	wl.kind == "CronJob"
    msga := {
		"alertMessage": sprintf("the following cronjobs are defined: %v/%v", [wl.metadata.namespace,wl.metadata.name]),
		"alertScore": 2,
		"packagename": "armo_builtins",
         "alertObject": {
			"k8sApiObjects": [wl]
		}
     }
}
