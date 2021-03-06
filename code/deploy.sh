GH_REPO="@github.com/$TRAVIS_REPO_SLUG.git"
FULL_REPO="https://$GH_TOKEN$GH_REPO"
git config --global user.name "Travis CI"
git config --global user.email "tim.trice@gmail.com"
git clone https://github.com/timtrice/twitter_api.git
cd twitter_api
git checkout master
Rscript --verbose code/02_retrieve.R
rm -rf docs
Rscript -e 'workflowr::wflow_build(update = TRUE, view = FALSE, verbose = TRUE)'
git add .
MSG="Rebuild documents, $(date) [ci skip]"
git commit -m "$MSG"
git push --force $FULL_REPO
