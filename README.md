# ancestry

Here's the usage:

`./autoscript /path/to/samples /path/to/refpanel snp.set`

### Files

There are samples already in the `samples/` folder or you could play with a few from www.opensnp.org

As for reference panel, unzip `PHYLO.zip` from [this github repository by Razib Khan](https://github.com/razibkkhan/RazibKhanDataCode) and place those files in a newly created `reference_panel/`.

I have provided a SNP set of ~9000 SNPs which gives accurate ancestries for large samples so far. The SNP set will be expanded to ~20000 soon.

## Usage

After the script is done running on a file in `samples/` it will produce an ancestry png file which you could choose to save. Press enter after viewing the file for it to run on the next file in the folder.
