import common

def FullOTA_InstallEnd(info):
  info.script.Print("Full OTA update, Writing x86vbox images...")
  # copy the data into the package.
  x86vbox_dat = info.input_zip.read("RADIO/x86vbox.dat")
  common.ZipWriteStr(info.output_zip, "x86vbox.dat", x86vbox_dat)

  # emit the script code to install this data on the device
  info.script.AppendExtra(
    """x86vbox.reprogram("the-key", package_extract_file("x86vbox.dat"));""")

def IncrementalOTA_InstallEnd(info):
  info.script.Print("Incremental OTA update, Writing x86vbox images...")
  # copy the data into the package.
  source_x86vbox_dat = info.source_zip.read("RADIO/x86vbox.dat")
  target_x86vbox_dat = info.target_zip.read("RADIO/x86vbox.dat")

  if source_x86vbox_dat == target_x86vbox_dat:
    # x86vbox.dat is unchanged from previous build; no
    # need to reprogram it
    return

  # include the new x86vbox.dat in the OTA package
  common.ZipWriteStr(info.output_zip, "x86vbox.dat", target_x86vbox_dat)

  # emit the script code to install this data on the device
  info.script.AppendExtra(
    """x86vbox.reprogram("the-key", package_extract_file("x86vbox.dat"));""")

