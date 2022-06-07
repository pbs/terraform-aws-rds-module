package test

import (
	"testing"
)

func TestProvisionedExample(t *testing.T) {
	testRDS(t, "provisioned")
}
